import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/domain/entities/user.dart';
import 'package:unyo/domain/entities/video_info.dart';

part 'video_state.freezed.dart';

@freezed
abstract class VideoState with _$VideoState implements HasEffects{
  const factory VideoState({
    required User loggedUser,
    @VideoInfoConverter() required VideoInfo videoInfo,
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _VideoState;

  const VideoState._();

  @override
  List<AppEffect> get stateEffects => effects;
}
