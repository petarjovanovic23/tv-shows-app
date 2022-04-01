import 'package:flutter/material.dart';
import 'package:tv_shows/models/storage_repository.dart';
import 'package:tv_shows/providers/request_provider.dart';

import '../models/user.dart';
import '../repository/networking_repository.dart';

class UserProfileProvider extends RequestProvider<User> {
  UserProfileProvider(this._networkingRepository, this._storageRepository) {
    fetchUserData();
  }

  late final NetworkingRepository _networkingRepository;
  late final StorageRepository _storageRepository;
  late String? _email;

  get email => _email;

  void fetchUserData() {
    _email = _storageRepository.authInfo!.uid;
  }

  void updateUserEmail(String newEmail) {
    print('user email extis $email');
    print('newemail $newEmail');
    if (email == newEmail ||
        newEmail == '' ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(newEmail)) {
      print('return');
      return;
    }
    executeRequest(
        requestBuilder: () => _networkingRepository.updateUserEmail(newEmail));
  }
}
