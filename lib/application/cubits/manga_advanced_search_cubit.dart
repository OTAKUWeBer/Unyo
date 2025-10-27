import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/manga_advanced_search_state.dart';
import 'package:unyo/core/di/locator.dart';

class MangaAdvancedSearchCubit extends Cubit<MangaAdvancedSearchState> with EffectMixin<MangaAdvancedSearchState> {
  final Logger _logger = sl<Logger>();

  MangaAdvancedSearchCubit()
      : super(const MangaAdvancedSearchState()) {
    _init();
  }

  @override
  MangaAdvancedSearchState copyStateWithEffects(
      MangaAdvancedSearchState state,
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