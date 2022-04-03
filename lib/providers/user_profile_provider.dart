import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  late String? _image;

  get email => _email;

  get image => _image;

  void fetchUserData() {
    _email = _storageRepository.authInfo!.uid;
  }

  void updateUserData({required String newEmail, PickedFile? image}) {
    if (newEmail == '' && image == null) {
      return;
    }
    executeRequest(
        requestBuilder: () =>
            _networkingRepository.updateUserData(newEmail, image));
  }
}
