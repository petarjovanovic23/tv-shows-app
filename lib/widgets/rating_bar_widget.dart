import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/show.dart';

import '../providers/rating_bar_provider.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget(this.show, {this.fixed = true, Key? key}) : super(key: key);
  final Show show;
  final bool fixed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return RatingBar.builder(
      ignoreGestures: fixed,
      itemSize: 32,
      initialRating: show.averageRating as double,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: fixed,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: theme.primaryColor,
      ),
      onRatingUpdate: (rating) {
        Provider.of<RatingBarProvider>(context, listen: false).setRating = rating.toInt();
      },
    );
  }
}
