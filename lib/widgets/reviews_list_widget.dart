import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/classes/review.dart';
import 'package:tv_shows/classes/show.dart';
import 'package:tv_shows/widgets/review_widget.dart';

class ReviewsListWidget extends StatelessWidget {
  final Show show;
  const ReviewsListWidget(this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Review> reviews = Provider.of<ReviewProvider>(context).getAllReviews();
    return show.numOfReviews == 0
        ? Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(child: Text('No reviews yet.', style: Theme.of(context).textTheme.bodyText1)),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${show.numOfReviews} REVIEWS, ${show.averageRating} AVERAGE',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                RatingBar.builder(
                  ignoreGestures: true,
                  itemSize: 32,
                  initialRating: show.averageRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                  ),
                  onRatingUpdate: (_) {},
                ),
                // SingleChildScrollView(
                //   child:
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (context, index) {
                        return ReviewWidget(reviews[index]);
                      }),
                ),
                // ),
              ],
            ),
          );
  }
}

/**
 * ListView.builder(
    itemCount: reviews.length,
    itemBuilder: (context, index) {
    return Text(
    reviews[0].comment,
    style: Theme.of(context).textTheme.bodyText2,
    );
    }),*/
