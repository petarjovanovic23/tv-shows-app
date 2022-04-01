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

  void updateUserPhoto(PickedFile image) {
    executeRequest(
        requestBuilder: () => _networkingRepository.uploadPhoto(image));
  }

  void updateUserEmail(String newEmail) {
    if (email == newEmail ||
        newEmail == '' ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(newEmail)) {
      return;
    }
    executeRequest(
        requestBuilder: () => _networkingRepository.updateUserEmail(newEmail));
  }

  void updateUserData({required String newEmail, PickedFile? image}) {
    if (newEmail == '' && image == null) {
      return;
    }
    executeRequest(
        requestBuilder: () =>
            _networkingRepository.updateUserData(newEmail, image));

    // if (newEmail != '' && image != null) {
    //   if (email != newEmail &&
    //       RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //           .hasMatch(newEmail)) {
    //     executeRequest(
    //         requestBuilder: () =>
    //             _networkingRepository.updateUserData(newEmail, image));
    //   } else {
    //     executeRequest(
    //         requestBuilder: () =>
    //             _networkingRepository.updateUserData(null, image));
    //   }
    // } else if (newEmail == '' && image != null) {
    //   executeRequest(
    //       requestBuilder: () =>
    //           _networkingRepository.updateUserData(null, image));
    // }

    // if (newEmail != null && image == null) {
    //   if (email != newEmail &&
    //       newEmail != '' &&
    //       ) {
    //   }
    // } else if (newEmail != null && image != null) {
    //   if ((email != newEmail || newEmail != '') &&
    //       RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //           .hasMatch(newEmail)) {
    //     print('ovaj');
    //     executeRequest(
    //         requestBuilder: () =>
    //             _networkingRepository.updateUserData(newEmail, image));
    //   }
    // } else if (newEmail == null && image != null) {
    //   executeRequest(
    //       requestBuilder: () =>
    //           _networkingRepository.updateUserData(null, image));
    // } else {
    //   executeRequest(
    //       requestBuilder: () =>
    //           _networkingRepository.updateUserData(newEmail, image));
    // }
  }
}
