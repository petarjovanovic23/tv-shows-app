import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/providers/review_provider.dart';
import 'package:tv_shows/widgets/review_widget.dart';

import '../models/show.dart' show Show;

class SliverListReviewsWidget extends StatelessWidget {
  final Show show;
  final Animation opacity;

  const SliverListReviewsWidget(this.show, this.opacity, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final reviewProvider = context.watch<ReviewProvider>();
    return reviewProvider.state.maybeWhen(
      orElse: () => Container(),
      loading: () => SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      success: (reviews) => SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Opacity(
                    opacity: opacity.value,
                    child: ReviewWidget(reviews[index]))),
            childCount: reviews.length),
      ),
      failure: (exception) => SliverToBoxAdapter(
        child: Center(
          child: Text(
            'Failed to fetch reviews.',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}
