// External dependencies
import 'dart:convert';
import 'package:flutter/foundation.dart';
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
    // Set player ffmpeg properties
    _configurePlayer();
    // Set player HTTP headers
    _setPlayerHttpHeaders(_video.headers);
    // Set player logs handler
    // _setPlayerLogsHandler();
    // Waits for video to be ready and initializes embedded tracks
    // TODO handle magnets
    // Set player media properties
    _player.setMedia(_video.videoUrl, mdk.MediaType.video);
    _player.setMedia(_video.videoUrl, mdk.MediaType.audio);
    _player.loop = 0; // No loop
    _player.state = mdk.PlaybackState.paused;
    _player.onMediaStatus((mdk.MediaStatus oldStatus, mdk.MediaStatus newStatus) {
      if (newStatus.test(mdk.MediaStatus.loaded)) {
        _initCaptionsAndAudiotracks();
        _player.state = mdk.PlaybackState.playing;
        setVolume(1.0);
        return false;
      }
      if (newStatus.test(mdk.MediaStatus.buffering)) {
        _isBuffering = true;
      }
      if (newStatus.test(mdk.MediaStatus.buffered)) {
        _isBuffering = false;
      }
      if(newStatus.test(mdk.MediaStatus.invalid)) {
        // TODO Warn user about invalid media and stop playback / leave
      }
      return true;
    });
  }

  // Getters
  Duration get position => Duration(milliseconds: _player.position);

  String get formattedPosition => formatMilliseconds(position.inMilliseconds);

  ValueNotifier<int?> get textureId => _player.textureId;

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
  bool play() {
    if (_isBuffering) return false;
    _player.state = mdk.PlaybackState.playing;
    return true;
  }

  bool pause() {
    if (_isBuffering) return false;
    _player.state = mdk.PlaybackState.paused;
    return true;
  }

  bool setLooping(bool loop) {
    loop ? _player.loop = -1 : _player.loop = 0;
    return true;
  }

  bool setVolume(double volume) {
    _player.volume = volume;
    return true;
  }

  bool setPlaybackSpeed(double newPlayBackSpeed) {
    _player.playbackRate = newPlayBackSpeed;
    return true;
  }

  bool seekTo(Duration newDuration) {
    _player.seek(position: newDuration.inMilliseconds);
    return true;
  }

  bool setCaptionOffset(Duration duration) {
    return false;
  }

  Future<bool> setCaption(int captionIndex) async {
    if (captionIndex < 0 || captionIndex >= captionTracks.length) {
      _currentCaptionTrack = null;
      return false;
    }
    _currentCaptionTrack = captionTracks[captionIndex];
    if (_currentCaptionTrack!.embedded) {
      _player.activeSubtitleTracks = [
        _currentCaptionTrack?.embeddedIndex ?? 0
      ];
    } else {
      _currentCaptionFile = await _loadExternalCaption(_currentCaptionTrack!);
      _player.setMedia(_currentCaptionTrack!.url, mdk.MediaType.subtitle);
    }
    return true;
  }

  bool setAudioTrack(int audioTrackIndex) {
    if (audioTrackIndex < 0 || audioTrackIndex >= audioTracks.length) {
      _currentAudioTrack = null;
      return false;
    }
    _currentAudioTrack = audioTracks[audioTrackIndex];
    if (_currentAudioTrack!.embedded) {
      _player.activeAudioTracks = [
        _currentAudioTrack?.embeddedIndex ?? 0
      ];
    } else {
      _player.setMedia(_currentAudioTrack!.url, mdk.MediaType.audio);
    }
    return true;
  }

  bool setFullscreen(bool fullscreen) {
    windowManager.setFullScreen(fullscreen);
    return true;
  }

  bool updateTexture() {
    _player.updateTexture();
    return true;
  }

  void dispose() {
    _player.state = mdk.PlaybackState.stopped;
    _player.dispose();
  }

  // Utilities
  void _configurePlayer() {
  // 1. DECODER: Be ruthless. If late, skip frames.
  _player.setProperty('framedrop', '1');

  // 2. NETWORK: Keep connections alive
  _player.setProperty('avformat.http_persistent', '1');
  _player.setProperty('avformat.reconnect', '1');
  _player.setProperty('avformat.reconnect_streamed', '1');
  _player.setProperty('avformat.reconnect_delay_max', '5');

  // 3. THE FIX for "0v 0.0s": Handle bad interleaving
  _player.setProperty('avformat.max_interleave_delta', '10000000');

  // 4. BUFFERING:
  // Increase to 50MB so it doesn't stop downloading while hunting for video packets
  _player.setProperty('avformat.buffer_size', '${50 * 1024 * 1024}');

  // 5. STARTUP: Analyze less to start faster
  _player.setProperty('avformat.analyzeduration', '2000000'); // 2s
  _player.setProperty('avformat.probesize', '1024000');       // 1MB

  // 6. PROTOCOLS
  _player.setProperty(
    'avformat.protocol_whitelist',
    'file,http,https,tcp,tls,udp,rtp,rtmp,rtmpe,rtmps,rtmpt,rtmpte,crypto,data',
  );
}

  void _setPlayerHttpHeaders(ext.Headers? headers) {
  if (headers == null || headers.headersMap.isEmpty) return;
  final userAgent = headers.headersMap.entries
      .firstWhere(
        (e) => e.key.toLowerCase() == 'user-agent',
        orElse: () => const MapEntry('', '')
      )
      .value;

  if (userAgent.isNotEmpty) {
    _player.setProperty('user_agent', userAgent);
  }
  final formattedHeaders = headers.headersMap.entries
      .where((e) => e.key.toLowerCase() != 'user-agent') // Filter out UA
      .map((e) {
        // Fix cookie separator logic (HTTP spec requires '; ' not ',')
        final value = e.key.toLowerCase() == 'cookie'
            ? e.value.replaceAll(',', '; ')
            : e.value;
        return '${e.key}: $value';
      })
      .join('\r\n'); // Join with CRLF

  if (formattedHeaders.isNotEmpty) {
    _player.setProperty('headers', formattedHeaders);
    _player.setProperty('avio.headers', formattedHeaders);
  }
}

  void _setPlayerLogsHandler() {
    mdk.setLogHandler((mdk.LogLevel level, String message) {
      if (!message.contains("unloaded media's position")) {
        switch (level) {
          case mdk.LogLevel.debug:
            // _logger.d("MDK Log: $message");
          case mdk.LogLevel.info:
            // _logger.i("MDK Log: $message");
          case mdk.LogLevel.warning:
            // _logger.w("MDK Log: $message");
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

  Future<void> _initCaptionsAndAudiotracks() async {
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
    captionTracks.addAll(_video.subtitleTracks);
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
    audioTracks.addAll(_video.audioTracks);
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

  String formatMilliseconds(int milliseconds) {
    // Calculate total seconds
    int totalSeconds = milliseconds ~/ 1000;

    // Calculate hours, minutes, and seconds
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    // Return the formatted string
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
