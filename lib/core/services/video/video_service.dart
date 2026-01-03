// External dependencies
import 'dart:convert';
import 'package:fvp/mdk.dart' as mdk;
import 'package:video_player/video_player.dart';
import 'package:logger/logger.dart';

// Internal dependencies
import 'package:unyo/domain/entities/extension/headers.dart' as ext;
import 'package:unyo/domain/entities/extension/track.dart' as ext;
import 'package:unyo/domain/entities/extension/video.dart' as ext;
import 'package:unyo/core/services/api/http/api_response.dart';
import 'package:unyo/core/services/api/http/empty_api_response.dart';
import 'package:unyo/core/services/api/http/http_service.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:window_manager/window_manager.dart';

class VideoService {
  // Services
  final Logger _logger = sl<Logger>();
  final HttpService _httpService = sl<HttpService>();

  // Properties
  ext.Video _video;
  int _playlistIndex;
  late final mdk.Player _player;
  final List<ext.Track> captionTracks = [];
  final List<ext.Track> audioTracks = [];
  ClosedCaptionFile? _currentCaptionFile;
  ext.Track? _currentCaptionTrack;
  ext.Track? _currentAudioTrack;
  bool _isBuffering = true;

  VideoService({required ext.Video video, required int playlistIndex}) : _playlistIndex = playlistIndex, _video = video {
    _player = mdk.Player();
    // TODO handle magnets
    // Set player media properties
    _player.setMedia(_video.videoUrl, mdk.MediaType.video);
    _player.loop = 0; // No loop
    _player.state = mdk.PlaybackState.paused;
    // Set player ffmpeg properties
    _configurePlayer();
    // Set player HTTP headers
    _setPlayerHttpHeaders(_video.headers);
    // Set player logs handler
    _setPlayerLogsHandler();
    // Waits for video to be ready and initializes embedded tracks
    _player.onMediaStatus((mdk.MediaStatus oldStatus, mdk.MediaStatus newStatus) {
      if (newStatus.rawValue == mdk.MediaStatus.loaded) {
        _initEmbeddedCaptionsAndAudiotracks();
      }
      if (newStatus.rawValue == mdk.MediaStatus.buffering) {
        _isBuffering = true;
      }
      if (newStatus.rawValue == mdk.MediaStatus.buffered) {
        _isBuffering = false;
      }
      return true;
    });
  }

  // Getters
  Duration get position => Duration(milliseconds: _player.position);

  Duration get duration => Duration(milliseconds: _player.mediaInfo.duration);

  double get percentagePlayed => (position.inMilliseconds / duration.inMilliseconds);

  double get volume => _player.volume;

  bool get isPlaying => _player.state == mdk.PlaybackState.playing;

  bool get isBuffering => _isBuffering;

  Future<bool> get isFullscreen async => await windowManager.isFullScreen();

  double get aspectRatio {
    final streams = _player.mediaInfo.video;
    if (streams != null && streams.isNotEmpty) {
      final codec = streams.first.codec;
      // codec.width and codec.height are ints
      return codec.width / codec.height;
    }
    return 16 / 9;
  }

  // Setters
  void play() {
    if (_isBuffering) return;
    _player.state = mdk.PlaybackState.playing;
  }

  void pause() {
    if (_isBuffering) return;
    _player.state = mdk.PlaybackState.paused;
  }

  void setLooping(bool loop) {
    loop ? _player.loop = -1 : _player.loop = 0;
  }

  void setVolume(double volume) {
    _player.volume = volume;
  }

  void setPlaybackSpeed(double newPlayBackSpeed) {
    _player.playbackRate = newPlayBackSpeed;
  }

  void seekTo(Duration newDuration) {
    _player.seek(position: newDuration.inMilliseconds);
  }

  void setCaptionOffset(Duration duration) {
    throw UnimplementedError("CaptionOffset not yet implemented");
  }

  Future<void> setCaption(int captionIndex) async {
    if (captionIndex < 0 || captionIndex >= captionTracks.length) {
      _currentCaptionTrack = null;
      return;
    }
    _currentCaptionTrack = captionTracks[captionIndex];
    if (_currentCaptionTrack!.embedded) {
      _player.activeSubtitleTracks = [
        _currentCaptionTrack?.embeddedIndex ?? 0
      ];
    } else {
      _currentCaptionFile = await _loadExternalCaption(_currentCaptionTrack!);
    }
  }

  void setAudioTrack(int audioTrackIndex) {
    if (audioTrackIndex < 0 || audioTrackIndex >= audioTracks.length) {
      _currentAudioTrack = null;
      return;
    }
    _currentAudioTrack = audioTracks[audioTrackIndex];
    if (_currentAudioTrack!.embedded) {
      _player.activeAudioTracks = [
        _currentAudioTrack?.embeddedIndex ?? 0
      ];
    }
  }

  void setFullscreen(bool fullscreen) {
    windowManager.setFullScreen(fullscreen);
  }

  void dispose() {
    _player.state = mdk.PlaybackState.stopped;
    _player.dispose();
  }

  // Utilities
  void _configurePlayer() {
    // Note might want to use avformat.user_agent
    _player.setProperty('avformat.extension_picky', '0');
    _player.setProperty('avformat.http_persistent', '1'); // NOTE: Not sure
    _player.setProperty('avformat.reconnect', '1');
    _player.setProperty('avformat.reconnect_streamed', '1');
    _player.setProperty('avformat.reconnect_delay_max', '5');
    _player.setProperty(
      'avformat.protocol_whitelist',
      'file,http,https,tcp,tls,udp,rtp,rtmp,rtmpe,rtmps,rtmpt,rtmpte,crypto,data',
    ); // NOTE: Not sure
  }

  void _setPlayerHttpHeaders(ext.Headers? headers) {
    if (headers != null && headers.headersMap.isNotEmpty) {
      final formattedHeaders = headers.headersMap.entries.map((e) => '${e.key}: ${e.value}').join('\r\n');
      _player.setProperty('headers', formattedHeaders);
      _player.setProperty('avio.headers', formattedHeaders);
    }
  }

  void _setPlayerLogsHandler() {
    mdk.setLogHandler((mdk.LogLevel level, String message) {
      if (!message.contains("unloaded media's position")) {
        switch (level) {
          case mdk.LogLevel.debug:
            _logger.d("MDK Log: $message");
          case mdk.LogLevel.info:
            _logger.i("MDK Log: $message");
          case mdk.LogLevel.warning:
            _logger.w("MDK Log: $message");
          case mdk.LogLevel.error:
            _logger.e("MDK Log: $message");
          case mdk.LogLevel.off:
            break;
          case mdk.LogLevel.all:
            break;
        }
      }
    });
  }

  Future<void> _initEmbeddedCaptionsAndAudiotracks() async {
    if (_player.mediaInfo.subtitle != null && _player.mediaInfo.subtitle!.isNotEmpty) {
      for (mdk.SubtitleStreamInfo subtitleStreamInfo in _player.mediaInfo.subtitle!) {
        captionTracks.add(
          ext.Track(
            url: "",
            lang:
                "${subtitleStreamInfo.metadata["title"] ?? ""} (${subtitleStreamInfo.metadata["language"]} - Embedded)",
            embedded: true,
          ),
        );
      }
    }

    if (_player.mediaInfo.audio != null && _player.mediaInfo.audio!.length > 1) {
      for (mdk.AudioStreamInfo audioStreamInfo in _player.mediaInfo.audio!) {
        audioTracks.add(
          ext.Track(
            url: "",
            lang:
            "${audioStreamInfo.metadata["title"] ?? ""} (${audioStreamInfo.metadata["language"]} - Embedded)",
            embedded: true,
            embeddedIndex: audioStreamInfo.index
          ),
        );
      }
    }
  }

  Future<ClosedCaptionFile> _loadExternalCaption(ext.Track captionTrack) async {
    if (captionTrack.url.isEmpty) {
      throw Exception("Caption track URL is empty");
    }
    ApiResponse<EmptyApiResponse> response = await _httpService.get(
      captionTrack.url,
      fromJson: EmptyApiResponse.fromJson,
    );
    if (response.statusCode != 200) {
      throw Exception(
        "Failed to load captions from ${captionTrack.url} with status code ${response.statusCode}",
      );
    }
    var bytes = response.bodyBytes;
    String content = String.fromCharCodes(bytes);
    return WebVTTCaptionFile(_formatCaptions(_getUtf8Text(content)));
  }

  String _getUtf8Text(String text) {
    List<int> bytes = text.codeUnits;
    return utf8.decode(bytes);
  }

  String _formatCaptions(String captions) {
    // Split the captions into pieces based on empty lines
    List<String> pieces = captions.split('\n\n');
    List<String> formattedPieces = [];
    for (int i = 0; i < pieces.length; i++) {
      formattedPieces.add(_replaceSecondNewLine(pieces[i], "\n", " "));
    }
    // Join the formatted pieces back together with empty lines
    String formattedCaptions = formattedPieces.join('\n\n');

    return formattedCaptions;
  }

  String _replaceSecondNewLine(String original, String pattern, String replacement) {
    int firstIndex = original.indexOf(pattern);
    if (firstIndex != -1) {
      int secondIndex = original.indexOf(pattern, firstIndex + 1);
      if (secondIndex != -1) {
        return original.replaceFirst(pattern, replacement, secondIndex);
      }
    }
    return original;
  }
}
