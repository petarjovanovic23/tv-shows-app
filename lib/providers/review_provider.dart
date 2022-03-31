import 'package:provider/provider.dart';
import 'package:tv_shows/providers/request_provider.dart';

import '../models/review.dart';
import '../models/show.dart';
import '../repository/networking_repository.dart';

class ReviewProvider extends RequestProvider<List<Review>>  {
  ReviewProvider(this._repository, this._show) {
    fetchReviews();
  }

  final NetworkingRepository _repository;
  final Show _show;

  void fetchReviews() {
    executeRequest(requestBuilder: ()  async {

      final rev = _repository.fetchReviews(_show);
      notifyListeners();
      return rev;
    });
  }

}
