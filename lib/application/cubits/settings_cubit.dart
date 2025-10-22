import 'dart:async';

import 'package:logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Internal dependencies
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/settings_state.dart';
import 'package:unyo/core/di/locator.dart';

class SettingsCubit extends Cubit<SettingsState>
    with EffectMixin<SettingsState> {
  final Logger _logger = sl<Logger>();

  SettingsCubit()
      : super(const SettingsState()) {
    _init();
  }

  @override
  SettingsState copyStateWithEffects(
      SettingsState state,
      List<AppEffect> effects,
      ) {
    return state.copyWith(effects: effects);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Logger get logger => _logger;

  void _init() async {
  }

}
