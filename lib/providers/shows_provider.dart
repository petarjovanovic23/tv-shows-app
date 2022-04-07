import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/providers/request_provider.dart';

import '../models/show.dart';
import '../repository/networking_repository.dart';

class ShowsProvider extends RequestProvider<List<Show>> {
  ShowsProvider(this._repository) {
    fetchShows(_repository);
  }

  final NetworkingRepository _repository;

  void fetchShows(NetworkingRepository repository) {
    executeRequest(requestBuilder: () => repository.fetchShows());
  }

  Future<void> pullToRefresh(BuildContext context) async {
    NetworkingRepository repository = context.read<NetworkingRepository>();
    await executeRequest(requestBuilder: () => repository.fetchShows());
  }
}
