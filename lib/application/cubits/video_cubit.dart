// External dependencies
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'dart:async';

// Internal dependencies
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/video_state.dart';
import 'package:unyo/core/notification/user_notifier.dart';
import 'package:unyo/core/notification/video_info_notifier.dart';
import 'package:unyo/core/services/video/video_service.dart';
import 'package:unyo/domain/entities/user.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/domain/entities/video_info.dart';

class VideoCubit extends Cubit<VideoState> with EffectMixin<VideoState> {
  // Repositories
  final Logger _logger = sl<Logger>();

  // Notifiers / Subscriptions
  final UserNotifier _loggedUserNotifier;
  final VideoInfoNotifier _videoInfoNotifier;
  late StreamSubscription<User> _loggedUserSubscription;
  late StreamSubscription<VideoInfo> _videoInfoSubscription;

  // Services
  late VideoService _videoService;

  VideoCubit(this._loggedUserNotifier, this._videoInfoNotifier)
    : super(VideoState(
      loggedUser: UserModel.empty(),
      videoInfo: VideoInfoModel.empty()
    )
  ) {
    _init();
  }

  @override
  VideoState copyStateWithEffects(VideoState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;

  @override
  Future<void> close() {
    _loggedUserSubscription.cancel();
    _videoInfoSubscription.cancel();
    return super.close();
  }

  void _init() {
    _loggedUserSubscription = _loggedUserNotifier.userStream.listen((loggedUser) {
      emit(state.copyWith(loggedUser: loggedUser));
    });
    _videoInfoSubscription = _videoInfoNotifier.videoInfoStream.listen((videoInfo) {
      _videoService = VideoService(video: videoInfo.currentVideo, playlistIndex: videoInfo.playlistIndex);
      emit(state.copyWith(videoInfo: videoInfo));
    });
  }
}
