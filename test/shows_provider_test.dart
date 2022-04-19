import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_shows/providers/request_state.dart';
import 'package:tv_shows/providers/shows_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';

import 'shows_provider_test.mocks.dart';

@GenerateMocks([NetworkingRepository])
void main() {
  group('Testing shows provider!', () {
    test('creating the shows provider', () {
      final networkingRepository = MockNetworkingRepository();
      when(networkingRepository.fetchShows()).thenAnswer((_) async => []);

      final showsProvider = ShowsProvider(networkingRepository);
    });

    test('calling the fetch shows', () {
      final networkingRepository = MockNetworkingRepository();
      when(networkingRepository.fetchShows()).thenAnswer((_) async => []);

      final showsProvider = ShowsProvider(networkingRepository);
      verify(showsProvider.fetchShows(networkingRepository)).called(1);
    });

    test('requesting fetch shows', () async {
      final networkingRepository = MockNetworkingRepository();
      when(networkingRepository.fetchShows()).thenAnswer((_) async => []);

      final showsProvider = ShowsProvider(networkingRepository);
      expect(showsProvider.state is RequestStateLoading, true);

      await Future.delayed(const Duration(milliseconds: 10));
      expect(showsProvider.state is RequestStateSuccess, true);
    });
  });
}
