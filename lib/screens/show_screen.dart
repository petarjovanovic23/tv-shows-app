import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/storage_repository.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/user_profile_screen.dart';
import 'package:tv_shows/widgets/hidden_shows_widget.dart';
import 'package:tv_shows/widgets/show_screen_top_widget.dart';
import 'package:tv_shows/widgets/shows_list_widget.dart';

import '../gen/assets.gen.dart';
import '../providers/show_screen_content_provider.dart';
import '../providers/shows_provider.dart';

class ShowScreen extends StatelessWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showUserEditingModal() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const UserProfileScreen();
        },
      );
    }

    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<ShowsProvider>(
            create: (context) =>
                ShowsProvider(context.read<NetworkingRepository>()),
          ),
          ChangeNotifierProvider<ShowsScreenContentProvider>(
            create: (_) => ShowsScreenContentProvider(),
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            ShowsProvider showsProvider = Provider.of<ShowsProvider>(context);
            return SafeArea(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: showUserEditingModal,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: Colors.transparent,
                          child: Assets.images.icProfilePlaceholderPng.image(),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 44),
                  const ShowScreenTopWidget(),
                  showsProvider.state.maybeWhen(
                    orElse: () => Container(),
                    loading: () => Expanded(
                        child: Center(
                            child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor))),
                    success: (shows) =>
                        Provider.of<ShowsScreenContentProvider>(context)
                                .isHidden
                            ? HiddenShowsWidget(constraints)
                            : ShowsListWidget(constraints, shows),
                    failure: (exception) => const Expanded(
                      child: Center(
                          child: Text(
                              'Error retrieving shows. Please try again!')),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
