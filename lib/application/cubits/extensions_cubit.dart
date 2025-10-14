import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/extensions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/core/di/locator.dart';

class ExtensionsCubit extends Cubit<ExtensionsState> with EffectMixin<ExtensionsState> {
  final Logger _logger = sl<Logger>();

  ExtensionsCubit() : super(
    const ExtensionsState(),
  ) {
    _init();
  }

  @override
  ExtensionsState copyStateWithEffects(ExtensionsState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;

  void _init() {
  }

}