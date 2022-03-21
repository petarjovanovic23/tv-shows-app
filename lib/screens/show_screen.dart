import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/widgets/hidden_shows_widget.dart';
import 'package:tv_shows/widgets/show_screen_top_widget.dart';
import 'package:tv_shows/widgets/shows_list_widget.dart';

class ShowScreen extends StatelessWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ShowsProvider>(
          create: (_) => ShowsProvider(),
        ),
        ChangeNotifierProvider<ShowsScreenContentProvider>(
          create: (_) => ShowsScreenContentProvider(),
        ),
      ],
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                const SizedBox(height: 44),
                const ShowScreenTopWidget(),
                Provider.of<ShowsScreenContentProvider>(context).isHidden
                    ? HiddenShowsWidget(constraints)
                    : ShowsListWidget(constraints),
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
