import 'package:tv_shows/providers/request_provider.dart';

import '../models/show.dart';
import '../repository/networking_repository.dart';

class ShowsProvider extends RequestProvider<List<Show>> {
  ShowsProvider(NetworkingRepository repository) {
    fetchShows(repository);
  }

  void fetchShows(NetworkingRepository repository) {
    executeRequest(requestBuilder: () => repository.fetchShows());
  }

  void addShow(Show show) {
    Show.allShows.add(show);
  }

  List<Show> getAllShows() {
    return Show.allShows;
  }
}
