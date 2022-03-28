import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tv_shows/providers/request_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';

part 'show.g.dart';

@JsonSerializable()
class Show {
  String? id;
  String? title;
  String? description;
  int? no_of_reviews;
  double? average_rating;
  String? image_url;

  Show({
    required this.id,
    required this.title,
    required this.description,
    required this.no_of_reviews,
    required this.average_rating,
    required this.image_url,
  });

  static List<Show> allShows = [];

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  Map<String, dynamic> toJson() => _$ShowToJson(this);
}

class ShowsProvider extends RequestProvider<List<Show>> {
  ShowsProvider(NetworkingRepository repository) {
    fetchShows(repository);
  }

  void fetchShows(NetworkingRepository repository) {
    executeRequest(requestBuilder: () => repository.fetchShows(this));
  }

  void addShow(Show show) {
    Show.allShows.add(show);
  }

  List<Show> getAllShows() {
    return Show.allShows;
  }
}

class CurrentShowProvider extends ChangeNotifier {
  late Show _currentShow;

  set currentShow(Show show) {
    _currentShow = show;
    // notifyListeners();
  }

  Show get currentShow => _currentShow;
}
