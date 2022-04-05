import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/gen/fonts.gen.dart';
import 'package:tv_shows/widgets/buttons/write_review_button.dart';

import '../models/show.dart' show CurrentShowProvider, Show;
import '../providers/current_show_provider.dart';
import '../providers/review_provider.dart';
import '../providers/write_review_provider.dart';
import '../repository/networking_repository.dart';
import '../widgets/rating_bar_widget.dart';
import '../widgets/sliver_list_reviews_widget.dart';

class ShowDetailsScreen extends StatefulWidget {
  final Show show;
  const ShowDetailsScreen(this.show, {Key? key}) : super(key: key);

  @override
  State<ShowDetailsScreen> createState() => _ShowDetailsScreenState();
}

class _ShowDetailsScreenState extends State<ShowDetailsScreen> {
  late ScrollController _scrollController;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients && _scrollController.offset > (300 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            centerTitle: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.show.imageUrl as String,
                fit: BoxFit.cover,
                height: 322,
              ),
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.show.title as String,
                  style: TextStyle(
                    fontFamily: FontFamily.roboto,
                    color: isShrink ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isShrink ? 24 : 32,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(widget.show.description as String, style: theme.textTheme.bodyText2),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Text('Reviews', style: theme.textTheme.headline3),
            ),
          ),

          if (widget.show.noOfReviews == 0)
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
                  '${widget.show.noOfReviews} REVIEWS, ${widget.show.averageRating} AVERAGE',
                  style: theme.textTheme.bodyText1,
                ),
              ),
            ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
              child: RatingBarWidget(widget.show),
            ),
          ),
          //
          SliverListReviewsWidget(widget.show),
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
                    Provider.of<CurrentShowProvider>(context).currentShow = widget.show;
                    return const WriteReviewButton();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
