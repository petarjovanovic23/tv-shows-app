import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_shows/models/review.dart';
import 'package:tv_shows/providers/request_state.dart';
import 'package:tv_shows/providers/review_provider.dart';
import 'package:tv_shows/providers/write_review_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';

import 'write_review_provider_test.mocks.dart';

@GenerateMocks([NetworkingRepository, ReviewProvider, Review])
void main() {
  group('testing the write review provider', () {
    test('creating the provider', () {
      final networkingRepository = MockNetworkingRepository();
      final reviewProvider = MockReviewProvider();

      final writeReviewProvider =
          WriteReviewProvider(networkingRepository, reviewProvider);
    });

    test('successful write review request execution', () async {
      final networkingRepository = MockNetworkingRepository();
      final reviewProvider = MockReviewProvider();
      when(networkingRepository.addReview(any))
          .thenAnswer((_) async => MockReview());

      final writeReviewProvider =
          WriteReviewProvider(networkingRepository, reviewProvider);

      writeReviewProvider.addReview(MockReview());

      expect(writeReviewProvider.state is RequestStateLoading, true);

      await Future.delayed(const Duration(milliseconds: 10));
      expect(writeReviewProvider.state is RequestStateSuccess, true);
    });

    test('failure on write review request', () async {
      final networkingRepository = MockNetworkingRepository();
      final reviewProvider = MockReviewProvider();
      when(networkingRepository.addReview(any)).thenThrow(Exception());

      final writeReviewProvider =
          WriteReviewProvider(networkingRepository, reviewProvider);

      writeReviewProvider.addReview(MockReview());

      expect(writeReviewProvider.state is RequestStateLoading, true);

      await Future.delayed(const Duration(milliseconds: 10));
      expect(writeReviewProvider.state is RequestStateFailure, true);
    });
  });
}
