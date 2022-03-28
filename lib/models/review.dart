import 'package:json_annotation/json_annotation.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/models/user.dart';
import 'package:tv_shows/providers/request_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';

part 'review.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
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

  Review.empty()
      : comment = '',
        rating = 0,
        show_id = 0;

  Review.submit(this.comment, this.rating, this.show_id);

  static List<Review> allReviews = [];

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

// TODO: u providere / razdvojiti modele i providere sve
class ReviewProvider extends RequestProvider<List<Review>> {
  ReviewProvider(NetworkingRepository repository, Show show) {
    fetchReviews(repository, show);
  }

  void fetchReviews(NetworkingRepository repository, Show show) {
    print('fetch reviews completed?');
    executeRequest(requestBuilder: () => repository.fetchReviews(show, this));
  }

  void addReview(Review review) {
    Review.allReviews.add(review);
  }

  List<Review> getAllReviews() {
    return Review.allReviews;
  }

  void clear() {
    Review.allReviews = [];
  }
}

class WriteReviewProvider extends RequestProvider<Review> {
  WriteReviewProvider(NetworkingRepository repository, ReviewProvider reviewProvider) {
    _repository = repository;
    _reviewProvider = reviewProvider;
  }

  late final NetworkingRepository _repository;
  late final ReviewProvider _reviewProvider;

  void addReview(Review review) {
    executeRequest(requestBuilder: () => _repository.addReview(review));
  }
}
