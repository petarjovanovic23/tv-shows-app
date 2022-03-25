import 'package:json_annotation/json_annotation.dart';

part 'register_info.g.dart';

@JsonSerializable()
class RegisterInfo {
  RegisterInfo()
      : email = null,
        password = null,
        password_confirmation = null;
  // RegisterInfo(this.email, this.password, this.passwordConfirmation);
  @override
  String toString() {
    return '$email, $password';
  }

  String? email, password, password_confirmation;

  factory RegisterInfo.fromJson(Map<String, dynamic> json) => _$RegisterInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterInfoToJson(this);
}
