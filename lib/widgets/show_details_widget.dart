import 'package:flutter/material.dart';
import 'package:tv_shows/widgets/reviews_list_widget.dart';

import '../models/show.dart' show Show;

class ShowDetailsWidget extends StatelessWidget {
  final Show show;

  const ShowDetailsWidget(this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(show.title as String, style: theme.textTheme.headline1),
              const SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Center(
                  child: Image.network(
                    show.image_url as String,
                    fit: BoxFit.cover,
                    height: 322,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(show.description as String, style: theme.textTheme.bodyText2),
              const SizedBox(height: 16.0),
              Text('Reviews', style: theme.textTheme.headline3),
              ReviewsListWidget(show),
            ],
          ),
        ),
      ),
    );
  }
}
