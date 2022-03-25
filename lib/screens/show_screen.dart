import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/widgets/hidden_shows_widget.dart';
import 'package:tv_shows/widgets/show_screen_top_widget.dart';
import 'package:tv_shows/widgets/shows_list_widget.dart';

class ShowScreen extends StatelessWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<ShowsProvider>(
            create: (context) => ShowsProvider(Provider.of<NetworkingRepository>(context, listen: false)),
          ),
          ChangeNotifierProvider<ShowsScreenContentProvider>(
            create: (_) => ShowsScreenContentProvider(),
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            ShowsProvider showsProvider = Provider.of<ShowsProvider>(context);
            return Column(
              children: [
                const SizedBox(height: 44),
                const ShowScreenTopWidget(),
                showsProvider.state.maybeWhen(
                  orElse: () => Container(),
                  loading: () =>
                      Expanded(child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor))),
                  success: (shows) => Provider.of<ShowsScreenContentProvider>(context).isHidden
                      ? HiddenShowsWidget(constraints)
                      : ShowsListWidget(constraints),
                  failure: (e) => const Expanded(
                    child: Center(child: Text('Error retrieving shows. Please try again!')),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ShowsScreenContentProvider extends ChangeNotifier {
  bool _isHidden = false;

  bool get isHidden => _isHidden;

  void switchContent() {
    _isHidden = !_isHidden;
    notifyListeners();
  }
}
