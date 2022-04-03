import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tv_shows/models/user.dart';

import 'auth_info.dart';

class StorageRepository {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    // StorageRepository().authInfo = await StorageRepository().getAuthInfo;
  }

  StorageRepository() {
    getAuthInfo;
  }

  AuthInfo? authInfo;
  final _userBox = Hive.openBox<String>('user_box');
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> store(Map<String, dynamic> json, String key) async {
    final box = await _userBox;
    await box.put(key, jsonEncode(json));
  }

  Future<Map<String, dynamic>?> getUser(String key) async {
    final authInfo = await getAuthInfo;
    final box = await _userBox;
    final string = box.get(key);
    if (string == null && authInfo == null) {
      return null;
    }
    return jsonDecode(string as String);
  }

  Future<void> delete() async {
    final box = await _userBox;
    await box.clear();
  }

  void setInfo(AuthInfo info) async {
    authInfo = info;

    storage.deleteAll();

    final writeToken =
        await storage.write(key: 'accessToken', value: authInfo!.accessToken);
    final writeClient =
        await storage.write(key: 'client', value: authInfo!.client);

    final writeTokenType =
        await storage.write(key: 'tokenType', value: authInfo!.tokenType);
    final writeUid = await storage.write(key: 'uid', value: authInfo!.uid);
  }

  get getAuthInfo async {
    if (authInfo != null) {
      return authInfo;
    }

    final accessToken = await storage.read(key: 'accessToken');
    final client = await storage.read(key: 'client');

    final tokenType = await storage.read(key: 'tokenType');
    final uid = await storage.read(key: 'uid');

    if (accessToken != null &&
        client != null &&
        tokenType != null &&
        uid != null) {
      print('dodijeli li ?');
      setInfo(AuthInfo(
          accessToken: accessToken,
          client: client,
          tokenType: tokenType,
          uid: uid));

      print('ifn ${authInfo!.uid}');
    }

    print(' ovaj se vraca? ${authInfo?.uid}');
    return authInfo;
  }

  void deleteUser() {
    storage.deleteAll();
    delete();
  }
}
