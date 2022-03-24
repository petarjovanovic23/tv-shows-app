import 'package:tv_shows/models/sign_in_info.dart';
import 'package:tv_shows/models/user.dart';
import 'package:tv_shows/providers/request_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';

class LoginProvider extends RequestProvider<User> {
  late SignInInfo _loginInfo;
  LoginProvider() {
    _loginInfo = SignInInfo();
  }

  void loginUser(NetworkingRepository repository) {
    executeRequest(
      requestBuilder: () => repository.loginUser(_loginInfo.email as String, _loginInfo.password as String),
    );
  }

  SignInInfo get loginInfo => _loginInfo;

  void setInfo(String email, String password) {
    _loginInfo.email = email;
    _loginInfo.password = password;
  }
}
