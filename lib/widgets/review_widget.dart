import 'package:flutter/material.dart';
import 'package:tv_shows/classes/review.dart';

class ReviewWidget extends StatelessWidget {
  final Review review;
  const ReviewWidget(this.review, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      review.comment,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
