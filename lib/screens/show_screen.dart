import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/classes/show.dart';
import 'package:tv_shows/gen/fonts.gen.dart';
import 'package:tv_shows/widgets/hidden_shows_widget.dart';
import 'package:tv_shows/widgets/shows_list_widget.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  bool _isHidden = false;

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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shows',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() => _isHidden = !_isHidden);
                        },
                        child: Text(
                          _isHidden ? 'Show' : 'Hide',
                          style: const TextStyle(fontFamily: FontFamily.roboto),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                          side: MaterialStateProperty.all(const BorderSide(color: Colors.black38)),
                        ),
                      ),
                    ],
                  ),
                ),
                _isHidden ? HiddenShowsWidget(constraints) : ShowsListWidget(constraints),
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
