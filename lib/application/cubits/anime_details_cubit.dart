import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/anime_details_state.dart';
import 'package:bloc/bloc.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/user.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsState> with EffectMixin<AnimeDetailsState> {

  AnimeDetailsCubit() : super(AnimeDetailsState(loggedUser: UserModel.empty(), selectedAnime: AnimeModel.empty()));

  @override
  AnimeDetailsState copyStateWithEffects(AnimeDetailsState state, List<AppEffect> effects) {
    // TODO: implement copyStateWithEffects
    throw UnimplementedError();
  }

  @override
  // TODO: implement logger
  Logger get logger => throw UnimplementedError();

}