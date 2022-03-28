import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/review.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/widgets/review_widget.dart';

import '../providers/review_provider.dart';

class ReviewsListWidget extends StatefulWidget {
  final Show show;
  const ReviewsListWidget(this.show, {Key? key}) : super(key: key);

  @override
  State<ReviewsListWidget> createState() => _ReviewsListWidgetState();
}

class _ReviewsListWidgetState extends State<ReviewsListWidget> {
  @override
  Widget build(BuildContext context) {
    List<Review> reviews = Provider.of<ReviewProvider>(context).getAllReviews();
    ThemeData theme = Theme.of(context);

    return widget.show.noOfReviews == 0
        ? Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(child: Text('No reviews yet.', style: theme.textTheme.bodyText1)),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.show.noOfReviews} REVIEWS, ${widget.show.averageRating} AVERAGE',
                  style: theme.textTheme.bodyText1,
                ),
                RatingBar.builder(
                  ignoreGestures: true,
                  itemSize: 32,
                  initialRating: widget.show.averageRating as double,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: theme.primaryColor,
                  ),
                  onRatingUpdate: (_) {},
                ),
                for (final review in reviews) ReviewWidget(review),
              ],
            ),
          );
  }
}
