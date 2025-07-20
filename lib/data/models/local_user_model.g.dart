// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalUserModel _$LocalUserModelFromJson(Map<String, dynamic> json) =>
    _LocalUserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarImage: json['avatarImage'] as String,
      bannerImage: json['bannerImage'] as String,
    );

Map<String, dynamic> _$LocalUserModelToJson(_LocalUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarImage': instance.avatarImage,
      'bannerImage': instance.bannerImage,
    };
