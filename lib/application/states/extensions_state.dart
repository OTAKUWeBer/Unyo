import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';

part 'extensions_state.freezed.dart';

@freezed
abstract class ExtensionsState with _$ExtensionsState implements HasEffects{
  const factory ExtensionsState({
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _ExtensionsState;

  const ExtensionsState._();

  @override
  List<AppEffect> get stateEffects => effects;
}