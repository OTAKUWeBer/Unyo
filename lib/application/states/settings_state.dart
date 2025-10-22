import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState implements HasEffects{
  const factory SettingsState({
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _SettingsState;

  const SettingsState._();

  @override
  List<AppEffect> get stateEffects => effects;
}