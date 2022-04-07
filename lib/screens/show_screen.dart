import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/models/storage_repository.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/user_profile_screen.dart';
import 'package:tv_shows/widgets/hidden_shows_widget.dart';
import 'package:tv_shows/widgets/show_screen_top_widget.dart';
import 'package:tv_shows/widgets/shows_list_widget.dart';

import '../gen/assets.gen.dart';
import '../models/user.dart';
import '../providers/show_screen_content_provider.dart';
import '../providers/shows_provider.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  User? user;

  void showUserEditingModal(BuildContext contextShowScreen) async {
    final result = await showModalBottomSheet<User>(
      isScrollControlled: true,
      context: contextShowScreen,
      builder: (contextUserProfile) {
        return UserProfileScreen(user as User);
      },
    );

    if (result != null) {
      setState(() {
        user = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    StorageRepository repository = context.read<StorageRepository>();
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<ShowsProvider>(
            create: (context) =>
                ShowsProvider(context.read<NetworkingRepository>()),
          ),
          ChangeNotifierProvider<ShowsScreenContentProvider>(
            create: (context) => ShowsScreenContentProvider(),
          ),
        ],
        child: user == null
            ? FutureBuilder(
                future: repository.getUser(repository.authInfo!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    user = User.fromJson(snapshot.data as Map<String, dynamic>);
                    ShowsProvider showsProvider =
                        Provider.of<ShowsProvider>(context);
                    return LayoutBuilder(builder: (context, constraints) {
                      return SafeArea(
                        child: Column(
                          children: [
                            _AvatarWidget(
                                user, () => showUserEditingModal(context)),
                            const ShowScreenTopWidget(),
                            showsProvider.state.maybeWhen(
                              orElse: () => Container(),
                              loading: () => _loadingWidget(context),
                              success: (shows) =>
                                  _successWidget(context, constraints, shows),
                              failure: (exception) => _failureWidget(),
                            ),
                          ],
                        ),
                      );
                    });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                },
              )
            : LayoutBuilder(builder: (context, constraints) {
                ShowsProvider showsProvider =
                    Provider.of<ShowsProvider>(context);
                return SafeArea(
                  child: Column(
                    children: [
                      _AvatarWidget(user, () => showUserEditingModal(context)),
                      const ShowScreenTopWidget(),
                      showsProvider.state.maybeWhen(
                        orElse: () => Container(),
                        loading: () => _loadingWidget(context),
                        success: (shows) =>
                            _successWidget(context, constraints, shows),
                        failure: (exception) => _failureWidget(),
                      ),
                    ],
                  ),
                );
              }),
      ),
    );
  }

  Expanded _failureWidget() {
    return const Expanded(
      child: Center(
        child: Text('Error retrieving shows. Please try again!'),
      ),
    );
  }

  StatelessWidget _successWidget(
      BuildContext context, BoxConstraints constraints, List<Show> shows) {
    return Provider.of<ShowsScreenContentProvider>(context).isHidden
        ? HiddenShowsWidget(constraints)
        : ShowsListWidget(constraints, shows);
  }

  Expanded _loadingWidget(BuildContext context) {
    return Expanded(
        child: Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor)));
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget(this.user, this.callback, {Key? key}) : super(key: key);
  final User? user;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            maxRadius: 15,
            backgroundColor: Colors.transparent,
            child: user?.imageUrl == null
                ? Assets.images.icProfilePlaceholderPng.image()
                : Image.network(user?.imageUrl as String),
          ),
        ),
      ),
    );
  }
}
