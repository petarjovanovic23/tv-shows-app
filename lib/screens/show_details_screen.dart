import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/gen/fonts.gen.dart';
import 'package:tv_shows/widgets/buttons/write_review_button.dart';
import 'package:tv_shows/widgets/show_details_widget.dart';

import '../models/review.dart';
import '../models/show.dart' show CurrentShowProvider, Show;
import '../repository/networking_repository.dart';
import '../widgets/rating_bar_widget.dart';

class ShowDetailsScreen extends StatelessWidget {
  final Show show;
  const ShowDetailsScreen(this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => ReviewProvider(Provider.of<NetworkingRepository>(context, listen: false), show),
        ),
      ],
      child: Builder(builder: (context) {
        return ListenableProvider(
          create: (context) => WriteReviewProvider(
            Provider.of<NetworkingRepository>(context, listen: false),
            Provider.of<ReviewProvider>(context, listen: false),
          ),
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: const Color(0xff979797),
                  centerTitle: true,
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      show.image_url as String,
                      fit: BoxFit.cover,
                      height: 322,
                    ),
                    title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        show.title as String,
                        style: const TextStyle(
                          fontFamily: FontFamily.roboto,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(show.description as String, style: theme.textTheme.bodyText2),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                    child: Text('Reviews', style: theme.textTheme.headline3),
                  ),
                ),
                if (show.no_of_reviews == 0)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Center(child: Text('No reviews yet.', style: theme.textTheme.bodyText1)),
                    ),
                  )
                else
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        '${show.no_of_reviews} REVIEWS, ${show.average_rating} AVERAGE',
                        style: theme.textTheme.bodyText1,
                      ),
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
                    child: RatingBarWidget(show),
                  ),
                ),
                SliverListReviewsWidget(show),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => CurrentShowProvider(),
                        ),
                      ],
                      child: Builder(
                        builder: (context) {
                          Provider.of<CurrentShowProvider>(context).currentShow = show;
                          return const WriteReviewButton();
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
