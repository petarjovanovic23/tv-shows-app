import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_shows/providers/rating_bar_provider.dart';

void main() {
  group('Testing the review bar provider', () {
    test('creating rating bar provider', () {
      final ratingBarProvider = RatingBarProvider();
      expect(ratingBarProvider.rating, 1);
    });
  });
}
