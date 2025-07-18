// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anilist_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnilistUserModel _$AnilistUserModelFromJson(Map<String, dynamic> json) =>
    _AnilistUserModel(
      name: json['name'] as String,
      avatarImage: json['avatarImage'] as String,
      accessCode: json['accessCode'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AnilistUserModelToJson(_AnilistUserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatarImage': instance.avatarImage,
      'accessCode': instance.accessCode,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
