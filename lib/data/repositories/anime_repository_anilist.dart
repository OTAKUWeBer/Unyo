// External dependencies
import 'package:logger/logger.dart';
import 'package:unyo/core/di/locator.dart';
// Internal dependencies
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/core/services/api/dto/media_collection_recently_completed_graphql_dto_entity.dart';
import 'package:unyo/core/services/api/dto/media_collection_trendingOrPopular_graphql_dto_entity.dart';
import 'package:unyo/core/services/api/dto/media_collection_upcoming_graphql_dto_entity.dart';
import 'package:unyo/core/services/api/graphql/queries/queries.dart' as queries;
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
  Future<(bool, List<Anime>)> getPopularAnimes(int page) async {
    ApiGraphQLResponse<MediaCollectionTrendingOrPopularGraphqlDtoEntity>
    popularMediaCollection = await _anilistGraphQLService.query(
      query: queries.mediaTrendingOrPopularQuery,
      fromJson: MediaCollectionTrendingOrPopularGraphqlDtoEntity.fromJson,
      variables: {
        "sort": "POPULARITY_DESC",
        "page": page,
        "perPage": 30,
        "type": "ANIME",
      },
    );
    throwIfGraphQlError(popularMediaCollection);
    List<Anime> popularAnimes =
        popularMediaCollection.data.page.media
            .map(
              (mediaEntry) =>
                  AnilistAnimeModel.fromPopularOrTrendingMediaEntry(mediaEntry),
            )
            .toList();
    return (true, popularAnimes);
  }

  @override
  Future<(bool, List<Anime>)> getRecentlyCompletedAnimes(int page) async {
    DateTime now = DateTime.now();
    DateTime monthAgo = now.subtract(const Duration(days: 30));
    ApiGraphQLResponse<MediaCollectionRecentlyCompletedGraphqlDtoEntity>
    recentlyCompleted = await _anilistGraphQLService.query(
      query: queries.mediaRecentlyCompletedQuery,
      fromJson: MediaCollectionRecentlyCompletedGraphqlDtoEntity.fromJson,
      variables: {
        "sort": "POPULARITY_DESC",
        "page": page,
        "perPage": 30,
        "endDateGreater": "${monthAgo.year.toString().padLeft(4, '0')}${monthAgo.month.toString().padLeft(2, '0')}${monthAgo.day.toString().padLeft(2, '0')}",
        "endDateLesser": "${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}",
        "type" : "ANIME"
      },
    );
    throwIfGraphQlError(recentlyCompleted);
    List<Anime> recentlyCompletedAnimes =
        recentlyCompleted.data.page.media
            .map((mediaEntry) => AnilistAnimeModel.fromRecentlyCompletedMediaEntry(mediaEntry))
            .toList();
    return (true, recentlyCompletedAnimes);
  }

  @override
  Future<(bool, List<Anime>)> getRecentlyReleasedAnimes(int page) async {
    ApiGraphQLResponse<MediaCollectionRecentlyReleasedGraphqlDtoEntity>
    airingSchedules = await _anilistGraphQLService.query(
      query: queries.animeRecentlyReleasedQuery,
      fromJson: MediaCollectionRecentlyReleasedGraphqlDtoEntity.fromJson,
      variables: {
        "sort": "TIME_DESC",
        "page": page,
        "perPage": 40,
        "notYetAired": false,
      },
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
  Future<(bool, List<Anime>)> getTrendingAnimes(int page) async {
    ApiGraphQLResponse<MediaCollectionTrendingOrPopularGraphqlDtoEntity>
    trendingMediaCollection = await _anilistGraphQLService.query(
      query: queries.mediaTrendingOrPopularQuery,
      fromJson: MediaCollectionTrendingOrPopularGraphqlDtoEntity.fromJson,
      variables: {
        "sort": "TRENDING_DESC",
        "page": page,
        "perPage": 30,
        "type": "ANIME",
      },
    );
    throwIfGraphQlError(trendingMediaCollection);
    List<Anime> trendingAnimes =
        trendingMediaCollection.data.page.media
            .map(
              (mediaEntry) =>
                  AnilistAnimeModel.fromPopularOrTrendingMediaEntry(mediaEntry),
            )
            .toList();
    return (true, trendingAnimes);
  }

  @override
  Future<(bool, List<Anime>)> getUpcomingAnimes(int page) async {
    DateTime now = DateTime.now();
    ApiGraphQLResponse<MediaCollectionUpcomingGraphqlDtoEntity>
    upcoming = await _anilistGraphQLService.query(
      query: queries.mediaUpcomingQuery,
      fromJson: MediaCollectionUpcomingGraphqlDtoEntity.fromJson,
      variables: {
        "sort": "POPULARITY_DESC",
        "page": page,
        "perPage": 30,
        "startDateGreater": "${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}",
        "type" : "ANIME"
      },
    );
    throwIfGraphQlError(upcoming);
    List<Anime> upcomingAnimes =
    upcoming.data.page.media
        .map((mediaEntry) => AnilistAnimeModel.fromUpcomingMediaEntry(mediaEntry))
        .toList();
    return (true, upcomingAnimes);
  }
}
