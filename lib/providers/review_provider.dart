import 'package:tv_shows/providers/request_provider.dart';

import '../models/review.dart';
import '../models/show.dart';
import '../repository/networking_repository.dart';

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
