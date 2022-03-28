import 'package:tv_shows/providers/request_provider.dart';
import 'package:tv_shows/providers/review_provider.dart';

import '../models/review.dart';
import '../repository/networking_repository.dart';

class WriteReviewProvider extends RequestProvider<Review> {
  WriteReviewProvider(NetworkingRepository repository, this.reviewProvider) {
    _repository = repository;
  }

  late final NetworkingRepository _repository;
  late final ReviewProvider reviewProvider;

  void addReview(Review review) {
    executeRequest(requestBuilder: () => _repository.addReview(review));
  }
}
