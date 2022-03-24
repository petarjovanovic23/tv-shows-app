import 'package:json_annotation/json_annotation.dart';
import 'package:tv_shows/providers/request_provider.dart';

part 'show.g.dart';

@JsonSerializable()
class Show {
  String id;
  String name;
  String description;
  int numOfReviews;
  double averageRating;
  String imageUrl;

  Show({
    required this.id,
    required this.name,
    required this.description,
    required this.numOfReviews,
    required this.averageRating,
    required this.imageUrl,
  });

  static final List<Show> allShows = [];

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  Map<String, dynamic> toJson() => _$ShowToJson(this);
}

class ShowsProvider extends RequestProvider<Show> {
  List<Show> getAllShows() {
    return Show.allShows;
  }
}
