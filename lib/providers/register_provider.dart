import 'package:tv_shows/models/register_info.dart';
import 'package:tv_shows/models/user.dart';
import 'package:tv_shows/providers/request_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';

class RegisterProvider extends RequestProvider<User> {
  late RegisterInfo _registerInfo;
  RegisterProvider() {
    _registerInfo = RegisterInfo();
  }

  void registerUser(NetworkingRepository repository) {
    executeRequest(requestBuilder: () => repository.registerUser(_registerInfo));
  }

  RegisterInfo get registerInfo => _registerInfo;

  void setInfo(String email, String password) {
    _registerInfo.email = email;
    _registerInfo.password = password;
    _registerInfo.password_confirmation = password;
  }
}
