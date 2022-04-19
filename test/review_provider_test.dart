import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/providers/request_state.dart';
import 'package:tv_shows/providers/review_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';

import 'review_provider_test.mocks.dart';

@GenerateMocks([NetworkingRepository, Show])
void main() {
  group('Testing review provider', () {
    test('creating the review provider', () {
      final networkingRepository = MockNetworkingRepository();
      final show = MockShow();

      final reviewProvider = ReviewProvider(networkingRepository, show);
    });

    test('calling the fetch reviews in constructor', () {
      final networkingRepository = MockNetworkingRepository();
      final show = MockShow();

      final reviewProvider = ReviewProvider(networkingRepository, show);

      verify(reviewProvider.fetchReviews()).called(1);
    });

    test('testing success of fetch reviews request', () async {
      final networkingRepository = MockNetworkingRepository();
      final show = MockShow();

      when(networkingRepository.fetchReviews(any)).thenAnswer((_) async => []);

      final reviewProvider = ReviewProvider(networkingRepository, show);
      expect(reviewProvider.state is RequestStateLoading, true);
      await Future.delayed(const Duration(milliseconds: 10));
      expect(reviewProvider.state is RequestStateSuccess, true);
    });

    test('testing the fetch reviews request exception', () async {
      final networkingRepository = MockNetworkingRepository();
      final show = MockShow();

      when(networkingRepository.fetchReviews(any)).thenThrow(Exception());

      final reviewProvider = ReviewProvider(networkingRepository, show);
      expect(reviewProvider.state is RequestStateFailure, true);
    });
  });
}
