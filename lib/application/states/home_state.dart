//External dependencies
import 'package:freezed_annotation/freezed_annotation.dart';

//Internal dependencies
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/data/models/models.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState implements HasEffects{
  const factory HomeState({
    required UserModel user,
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _HomeState;

  const HomeState._();

  @override
  List<AppEffect> get stateEffects => effects;
}
