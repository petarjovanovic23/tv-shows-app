import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_shows/models/review.dart';
import 'package:tv_shows/models/user.dart';

import 'login_provider_test.mocks.dart';

@GenerateMocks([User])
void main() {
  group('testing the review model', () {
    test('creating a review', () {
      final review = Review(
          id: 'id', comment: 'comment', rating: 0, showId: 0, user: MockUser());
      expect(review.showId, 0);
      expect(review.rating, 0);
      expect(review.comment, 'comment');
      expect(review.id, 'id');
      expect(review.user is MockUser, true);
    });

    test('creating a submit review', () {
      final review = Review.submit('comment', 0, 0);
      expect(review.showId, 0);
      expect(review.rating, 0);
      expect(review.comment, 'comment');
    });
  });
}
