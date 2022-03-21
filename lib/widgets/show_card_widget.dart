import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/screens/show_details_screen.dart';

import '../models/show.dart';

class ShowCardWidget extends StatelessWidget {
  final BuildContext context;
  final int index;

  const ShowCardWidget(this.context, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Show currentShow = Provider.of<ShowsProvider>(context).getAllShows()[index];
    TextTheme theme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShowDetailsScreen(currentShow)));
      },
      child: SizedBox(
        height: 302,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                currentShow.imageUrl,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Text(
                  currentShow.name,
                  style: theme.headline2,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  currentShow.description,
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
