import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_shows/models/user.dart';
import 'package:tv_shows/providers/login_provider.dart';
import 'package:tv_shows/providers/request_state.dart';
import 'package:tv_shows/repository/networking_repository.dart';

import 'login_provider_test.mocks.dart';

@GenerateMocks([NetworkingRepository, User])
void main() {
  group('Testing the login provider', () {
    test('creating the provider', () {
      final loginProvider = LoginProvider();

      expect(loginProvider.loginInfo.email, null);
      expect(loginProvider.loginInfo.password, null);
    });

    test('setting login info', () {
      final loginProvider = LoginProvider();

      loginProvider.setInfo('email', 'password');

      expect(loginProvider.loginInfo.email, 'email');
      expect(loginProvider.loginInfo.password, 'password');
    });

    test('executing successful login user request', () async {
      final loginProvider = LoginProvider();

      final networkingRepository = MockNetworkingRepository();

      when(networkingRepository.loginUser(any))
          .thenAnswer((_) async => MockUser());

      loginProvider.loginUser(networkingRepository);

      expect(loginProvider.state is RequestStateLoading, true);
      await Future.delayed(const Duration(milliseconds: 10));
      expect(loginProvider.state is RequestStateSuccess, true);
    });

    test('failure on login user request', () async {
      final loginProvider = LoginProvider();

      final networkingRepository = MockNetworkingRepository();

      when(networkingRepository.loginUser(any)).thenThrow(Exception());

      loginProvider.loginUser(networkingRepository);

      expect(loginProvider.state is RequestStateFailure, true);
    });
  });
}
