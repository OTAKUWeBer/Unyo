// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalUserModel _$LocalUserModelFromJson(Map<String, dynamic> json) =>
    _LocalUserModel(
      name: json['name'] as String,
      avatarImage: json['avatarImage'] as String,
      accessCode: json['accessCode'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$LocalUserModelToJson(_LocalUserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatarImage': instance.avatarImage,
      'accessCode': instance.accessCode,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
