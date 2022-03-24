import 'package:json_annotation/json_annotation.dart';

part 'sign_in_info.g.dart';

@JsonSerializable()
class SignInInfo {
  SignInInfo()
      : email = null,
        password = null;
  String? email, password;

  factory SignInInfo.fromJson(Map<String, dynamic> json) => _$SignInInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInInfoToJson(this);
}
