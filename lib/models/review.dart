import 'package:json_annotation/json_annotation.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/models/user.dart';
import 'package:tv_shows/providers/request_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  String? id;
  String comment;
  int rating;
  int show_id;
  User? user;
  Review({
    required this.id,
    required this.comment,
    required this.rating,
    required this.show_id,
    required this.user,
  });

  static List<Review> allReviews = [];

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

class ReviewProvider extends RequestProvider<List<Review>> {
  ReviewProvider(NetworkingRepository repository, Show show) {
    _fetchReviews(repository, show);
  }

  void _fetchReviews(NetworkingRepository repository, Show show) {
    executeRequest(requestBuilder: () => repository.fetchReviews(show, this));
  }

  List<Review> getShowReviews(Show show) {
    return Review.allReviews.where((review) => review.show_id == int.parse(show.id as String)).toList();
  }

  void addReview(Review review) {
    Review.allReviews.add(review);
  }

  List<Review> getAllReviews() {
    return Review.allReviews;
  }
}
