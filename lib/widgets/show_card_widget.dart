import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/providers/review_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/show_details_screen.dart';

import '../models/show.dart';

class ShowCardWidget extends StatelessWidget {
  final BuildContext context;
  final Show show;

  const ShowCardWidget(this.context, this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    dynamic _reviews;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (context) => ReviewProvider(context.read<NetworkingRepository>(), show),
              child: ShowDetailsScreen(show),
            ),
          ),
        );
      },
      child: SizedBox(
        height: 302,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  show.imageUrl as String,
                  height: 182,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Text(
                  show.title ?? '',
                  style: theme.headline2,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  show.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
