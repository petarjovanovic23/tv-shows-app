// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterInfo _$RegisterInfoFromJson(Map<String, dynamic> json) => RegisterInfo()
  ..email = json['email'] as String?
  ..password = json['password'] as String?
  ..password_confirmation = json['password_confirmation'] as String?;

Map<String, dynamic> _$RegisterInfoToJson(RegisterInfo instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.password_confirmation,
    };
