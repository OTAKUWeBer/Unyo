// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoInfoModel _$VideoInfoModelFromJson(Map<String, dynamic> json) =>
    _VideoInfoModel(
      currentVideo: const VideoConverter().fromJson(
        json['currentVideo'] as Map<String, dynamic>,
      ),
      playlistIndex: (json['playlistIndex'] as num).toInt(),
    );

Map<String, dynamic> _$VideoInfoModelToJson(_VideoInfoModel instance) =>
    <String, dynamic>{
      'currentVideo': const VideoConverter().toJson(instance.currentVideo),
      'playlistIndex': instance.playlistIndex,
    };
