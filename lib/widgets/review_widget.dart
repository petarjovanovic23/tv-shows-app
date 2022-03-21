import 'package:flutter/material.dart';
import 'package:tv_shows/models/review.dart';

class ReviewWidget extends StatelessWidget {
  final Review review;
  const ReviewWidget(this.review, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(backgroundColor: Colors.transparent, child: Image.asset(review.imageUrl)),
              Text(review.userEmail, style: theme.textTheme.headline4),
              Row(
                children: [
                  Text(review.rating.toString(), style: TextStyle(color: theme.primaryColor)),
                  Icon(Icons.star, color: theme.primaryColor),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(review.comment, style: theme.textTheme.bodyText2),
          const Divider(),
        ],
      ),
    );
  }
}
