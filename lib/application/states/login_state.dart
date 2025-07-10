//External dependencies
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';

//Internal dependencies
import 'package:unyo/data/models/models.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState implements HasEffects{
  const factory LoginState({
    required UserModel user,
    required List<UserModel> availableUsers,
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _LoginState;

  const LoginState._();

  @override
  List<AppEffect> get stateEffects => effects;
}
