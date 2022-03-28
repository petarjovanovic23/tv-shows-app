// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInInfo _$SignInInfoFromJson(Map<String, dynamic> json) => SignInInfo()
  ..email = json['email'] as String?
  ..password = json['password'] as String?;

Map<String, dynamic> _$SignInInfoToJson(SignInInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
