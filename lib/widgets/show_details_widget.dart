import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/widgets/review_widget.dart';

import '../models/review.dart';
import '../models/show.dart' show Show;

class SliverListReviewsWidget extends StatelessWidget {
  final Show show;

  const SliverListReviewsWidget(this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Review> reviews = Provider.of<ReviewProvider>(context).getAllReviews();
    ThemeData theme = Theme.of(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ReviewWidget(reviews[index]),
              ),
          childCount: reviews.length),
    );
  }
}
