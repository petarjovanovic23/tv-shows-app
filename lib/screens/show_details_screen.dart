import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/classes/review.dart' show ReviewProvider;
import 'package:tv_shows/widgets/buttons/write_review_button.dart';

import '../classes/show.dart' show Show;

class ShowDetailsScreen extends StatelessWidget {
  final Show show;
  const ShowDetailsScreen(this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (_) => ReviewProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: theme.backgroundColor,
        ),
        backgroundColor: theme.backgroundColor,
        body: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(show.name, style: theme.textTheme.headline1),
                      const SizedBox(height: 16.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          show.imageUrl,
                          fit: BoxFit.cover,
                          height: 322,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(show.description, style: theme.textTheme.bodyText2),
                      const SizedBox(height: 16.0),
                      Text('Reviews', style: theme.textTheme.headline3),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Center(child: Text('No reviews yet.', style: Theme.of(context).textTheme.bodyText1)),
                      ),
                    ],
                  ),
                ),
                const WriteReviewButton(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
