import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/show.dart';
import '../providers/shows_provider.dart';
import '../repository/networking_repository.dart';
import 'show_card_widget.dart';

class ShowsListWidget extends StatelessWidget {
  const ShowsListWidget(this.constraints, this.shows, {Key? key}) : super(key: key);

  final BoxConstraints constraints;
  final List<Show> shows;

  Future<void> pullToRefresh(BuildContext context) async {
    NetworkingRepository repository = Provider.of<NetworkingRepository>(context, listen: false);
    ShowsProvider showsProvider = Provider.of<ShowsProvider>(context, listen: false);
    await showsProvider.executeRequest(requestBuilder: () => repository.fetchShows());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: constraints.maxHeight * 0.8,
        child: RefreshIndicator(
          color: Theme.of(context).primaryColor,
          onRefresh: () => pullToRefresh(context),
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
