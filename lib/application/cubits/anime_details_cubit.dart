import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/anime_details_state.dart';
import 'package:bloc/bloc.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/user.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsState>
    with EffectMixin<AnimeDetailsState> {
  final Logger _logger = sl<Logger>();

  AnimeDetailsCubit()
    : super(
        AnimeDetailsState(
          loggedUser: UserModel.empty(),
          selectedAnime: AnimeModel.empty(),
        ),
      ) {
    _init();
  }

  @override
  AnimeDetailsState copyStateWithEffects(
    AnimeDetailsState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;

  void navigateBackToAnimePage() {
    _logger.d("Returning to Anime Page");
    popRouteEffect();
  }

  void _init() async {
    // TODO implement init for anime details cubit
  }
}
