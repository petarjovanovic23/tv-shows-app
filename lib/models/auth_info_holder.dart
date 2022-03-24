import 'auth_info.dart';

class AuthInfoHolder {
  AuthInfo? authInfo;

  void setInfo(AuthInfo info) {
    authInfo = info;
  }
}
