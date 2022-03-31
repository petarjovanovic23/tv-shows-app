import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tv_shows/models/user.dart';

import 'auth_info.dart';

class StorageRepository {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
  }

  AuthInfo? authInfo;
  final _userBox = Hive.openBox<User>('user_box');

  Future<Iterable<User>> get results => _userBox.then((value) => value.values);

  Future<void> store(User user) async {
    final box = await _userBox;
    await box.add(user);
  }

  void setInfo(AuthInfo info) async {
    authInfo = info;
    print('setting');
    const FlutterSecureStorage storage = FlutterSecureStorage();

    final writeToken = await storage.write(key: 'accessToken', value: authInfo!.accessToken);
    final writeClient = await storage.write(key: 'client', value: authInfo!.client);

    final writeTokenType = await storage.write(key: 'tokenType', value: authInfo!.tokenType);
    final writeUid = await storage.write(key: 'uid', value: authInfo!.uid);
  }

  get getAuthInfo async {
    if (authInfo != null) {
      return authInfo;
    }

    const FlutterSecureStorage storage = FlutterSecureStorage();

    final accessToken = await storage.read(key: 'accessToken');
    final client = await storage.read(key: 'client');

    final tokenType = await storage.read(key: 'tokenType');
    final uid = await storage.read(key: 'uid');

    if (accessToken != null && client != null && tokenType != null && uid != null) {
      authInfo = AuthInfo(accessToken: accessToken, client: client, tokenType: tokenType, uid: uid);
    }

    return authInfo;
  }
}
