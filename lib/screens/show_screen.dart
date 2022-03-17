import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/classes/show.dart';
import 'package:tv_shows/gen/assets.gen.dart';
import 'package:tv_shows/gen/fonts.gen.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShowsProvider(),
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
                _isHidden
                    ? Center(
                        child: Container(
                        height: constraints.maxHeight * 0.72,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.images.icShowsEmptyState),
                            const SizedBox(height: 20),
                            const Text('Your shows are not showing. Get it?', style: TextStyle(color: Colors.black))
                          ],
                        ),
                      ))
                    : SingleChildScrollView(
                        child: SizedBox(
                          height: constraints.maxHeight * 0.8,
                          child: ListView.builder(
                            itemCount: Provider.of<ShowsProvider>(context).getAllShows().length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 302,
                                child: Card(
                                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
                                  elevation: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        Provider.of<ShowsProvider>(context).getAllShows()[index].imageUrl,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                        child: Text(
                                          Provider.of<ShowsProvider>(context).getAllShows()[index].name,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: FontFamily.roboto,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Text(
                                          Provider.of<ShowsProvider>(context).getAllShows()[index].description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Color(0xffaaaaaa),
                                            fontFamily: FontFamily.roboto,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
