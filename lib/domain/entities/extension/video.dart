import 'package:k3vinb5_aniyomi_bridge/jmodels/jheaders.dart';
import 'package:k3vinb5_aniyomi_bridge/jmodels/jtrack.dart';
import 'package:k3vinb5_aniyomi_bridge/jmodels/jvideo.dart';
import 'package:unyo/domain/entities/extension/headers.dart';
import 'package:unyo/domain/entities/extension/track.dart';

class Video {
  final String url;
  final String title;
  final String quality;
  final String videoUrl;
  final Headers? headers;
  final bool initialized;
  final List<Track> audioTracks;
  final List<Track> subtitleTracks;
  final int? bitrate;
  final int? resolution;

  const Video({
    required this.url,
    required this.title,
    required this.quality,
    required this.videoUrl,
    required this.headers,
    required this.initialized,
    required this.audioTracks,
    required this.subtitleTracks,
    required this.bitrate,
    required this.resolution,
  });

  factory Video.fromJVideo(JVideo jVideo) {
    jObjIsNotNull(jObj) => jObj != null;
    return Video(
      url: jVideo.getUrl().toDartString(),
      title: jVideo.getVideoTitle().toDartString(),
      quality: jVideo.getQuality().toDartString(),
      videoUrl: jVideo.getVideoUrl().toDartString(),
      headers: Headers.fromJHeaders(jVideo.getHeaders()?.as<JHeaders>(JHeaders.type)),
      initialized: jVideo.getInitialized(),
      audioTracks:
          jVideo
              .getAudioTracks()
              .where(jObjIsNotNull)
              .map((jObj) => Track.fromJTrack(jObj.as<JTrack>(JTrack.type)))
              .toList(),
      subtitleTracks:
          jVideo
              .getSubtitleTracks()
              .where(jObjIsNotNull)
              .map((jObj) => Track.fromJTrack(jObj.as<JTrack>(JTrack.type)))
              .toList(),
      bitrate: jVideo.getBitrate()?.intValue(),
      resolution: jVideo.getResolution()?.intValue(),
    );
  }
}
