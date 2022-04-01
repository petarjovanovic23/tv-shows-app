import 'package:tv_shows/providers/request_provider.dart';
import 'package:tv_shows/providers/review_provider.dart';

import '../models/review.dart';
import '../models/show.dart';
import '../repository/networking_repository.dart';

class WriteReviewProvider extends RequestProvider<Review> {
  WriteReviewProvider(this._repository, this.reviewProvider);

  late final NetworkingRepository _repository;
  late final ReviewProvider reviewProvider;

  void addReview(Review review) {
    executeRequest(requestBuilder: () async {
      final rev = await _repository.addReview(review);
      reviewProvider.fetchReviews();
      return rev;
    });
  }
}
