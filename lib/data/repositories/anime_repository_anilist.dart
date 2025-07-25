// External dependencies
import 'package:logger/logger.dart';

// Internal dependencies
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/core/services/api/graphql/queries/queries.dart' as queries;
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/api/dto/media_collection_recently_released_graphql_dto_entity.dart';
import 'package:unyo/core/services/api/graphql/graphql_response.dart';
import 'package:unyo/core/services/api/graphql/graphql_service.dart';
import 'package:unyo/data/models/anilist_anime_model.dart';
import 'package:unyo/data/repositories/repository_mixin.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/repositories/anime_repository.dart';

class AnimeRepositoryAnilist with RepositoryMixin implements AnimeRepository {
  final GraphQLService _anilistGraphQLService = sl<GraphQLService>(
    instanceName: config.anilistGraphQlService,
  );
  final Logger _logger = sl<Logger>();

  @override
  Future<(bool, List<Anime>)> getPopularAnimes(int page) {
    throw UnimplementedError();
  }

  @override
  Future<(bool, List<Anime>)> getRecentlyCompletedAnimes(int page) {
    throw UnimplementedError();
  }

  @override
  Future<(bool, List<Anime>)> getRecentlyReleasedAnimes(int page) async {
    ApiGraphQLResponse<MediaCollectionRecentlyReleasedGraphqlDtoEntity>
    airingSchedules = await _anilistGraphQLService.query(
      query: queries.animeRecentlyReleasedQuery,
      fromJson: MediaCollectionRecentlyReleasedGraphqlDtoEntity.fromJson,
      variables: {"sort": "TIME_DESC", "page": page, "perPage": 30, "notYetAired": false},
    );
    throwIfGraphQlError(airingSchedules);
    List<Anime> recentlyReleasedAnimes =
        airingSchedules.data.page.airingSchedules
            .map((schedule) => AnilistAnimeModel.fromScheduleEntry(schedule))
            .toList();
    Map<int, Anime> uniqueRecentlyReleasedAnimes = {};
    recentlyReleasedAnimes.forEach((anime) {
      if (!uniqueRecentlyReleasedAnimes.containsKey(anime.id)) {
        uniqueRecentlyReleasedAnimes[anime.id] = anime;
      }
    });
    return (true, uniqueRecentlyReleasedAnimes.values.toList());
  }

  @override
  Future<(bool, List<Anime>)> getTrendingAnimes(int page) {
    throw UnimplementedError();
  }

  @override
  Future<(bool, List<Anime>)> getUpcomingAnimes(int page) {
    throw UnimplementedError();
  }
}
