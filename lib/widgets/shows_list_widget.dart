import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/show.dart' show ShowsProvider;
import '../repository/networking_repository.dart';
import 'show_card_widget.dart';

class ShowsListWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const ShowsListWidget(this.constraints, {Key? key}) : super(key: key);

  Future<void> pullToRefresh(BuildContext context) async {
    NetworkingRepository repository = Provider.of<NetworkingRepository>(context, listen: false);
    ShowsProvider showsProvider = Provider.of<ShowsProvider>(context, listen: false);
    await showsProvider.executeRequest(requestBuilder: () => repository.fetchShows(showsProvider));
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
            itemCount: Provider.of<ShowsProvider>(context).getAllShows().length,
            itemBuilder: (context, index) {
              return ShowCardWidget(context, index);
            },
          ),
        ),
      ),
    );
  }
}
