import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/show.dart';
import '../providers/shows_provider.dart';
import 'show_card_widget.dart';

class ShowsListWidget extends StatelessWidget {
  const ShowsListWidget(this.constraints, this.shows, {Key? key}) : super(key: key);

  final BoxConstraints constraints;
  final List<Show> shows;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: constraints.maxHeight * 0.8,
        child: RefreshIndicator(
          color: Theme.of(context).primaryColor,
          onRefresh: () => context.read<ShowsProvider>().pullToRefresh(context),
          child: ListView.builder(
            itemCount: shows.length,
            itemBuilder: (context, index) {
              return ShowCardWidget(context, shows[index]);
            },
          ),
        ),
      ),
    );
  }
}
