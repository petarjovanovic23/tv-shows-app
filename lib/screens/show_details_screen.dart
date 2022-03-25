import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/review.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/widgets/buttons/write_review_button.dart';
import 'package:tv_shows/widgets/show_details_widget.dart';

import '../models/show.dart' show Show;

class ShowDetailsScreen extends StatelessWidget {
  final Show show;
  const ShowDetailsScreen(this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: theme.backgroundColor,
      ),
      backgroundColor: theme.backgroundColor,
      body: ListenableProvider(
        create: (context) => ReviewProvider(Provider.of<NetworkingRepository>(context, listen: false), show),
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ShowDetailsWidget(show),
                const WriteReviewButton(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
