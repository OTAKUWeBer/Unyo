// External dependencies
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:logger/logger.dart';
// Internal dependencies
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/api/dto/anilist/media_collection_recently_completed_graphql_dto_entity.dart';
import 'package:unyo/core/services/api/dto/anilist/media_collection_trendingOrPopular_graphql_dto_entity.dart';
import 'package:unyo/core/services/api/dto/anilist/media_collection_upcoming_graphql_dto_entity.dart';
import 'package:unyo/core/services/api/dto/anilist/media_details_graphql_entity.dart';
import 'package:unyo/core/services/api/graphql/graphql_response.dart';
import 'package:unyo/core/services/api/graphql/graphql_service.dart';
import 'package:unyo/data/models/anilist_manga_details.dart';
import 'package:unyo/data/models/anilist_manga_model.dart';
import 'package:unyo/data/models/anilist_user_model.dart';
import 'package:unyo/data/repositories/repository_mixin.dart';
import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/manga_details.dart';
import 'package:unyo/domain/entities/user.dart';
import 'package:unyo/domain/repositories/manga_repository.dart';

import '../../core/services/api/graphql/queries/queries.dart' as queries;

class MangaRepositoryAnilist with RepositoryMixin implements MangaRepository {
  final GraphQLService _anilistGraphQLService = sl<GraphQLService>(
    instanceName: config.anilistGraphQlService,
  );
  final Logger _logger = sl<Logger>();

  @override
  Future<(bool, List<Manga>)> getPopularMangas(int page) async {
    ApiGraphQLResponse<MediaCollectionTrendingOrPopularGraphqlDtoEntity>
    popularMediaCollection = await _anilistGraphQLService.query(
      query: queries.mediaTrendingOrPopularQuery,
      fromJson: MediaCollectionTrendingOrPopularGraphqlDtoEntity.fromJson,
      variables: {
        "sort": "POPULARITY_DESC",
        "page": page,
        "perPage": 30,
        "type": "MANGA",
      },
    );
    throwIfGraphQlError(popularMediaCollection);
    List<Manga> popularMangas =
        popularMediaCollection.data.page.media
            .map(
              (mediaEntry) =>
                  AnilistMangaModel.fromPopularOrTrendingMediaEntry(mediaEntry),
            )
            .toList();
    return (true, popularMangas);
  }

  @override
  Future<(bool, List<Manga>)> getRecentlyCompletedMangas(int page) async {
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
        "type" : "MANGA"
      },
    );
    throwIfGraphQlError(recentlyCompleted);
    List<Manga> recentlyCompletedMangas =
        recentlyCompleted.data.page.media
            .map((mediaEntry) => AnilistMangaModel.fromRecentlyCompletedMediaEntry(mediaEntry))
            .toList();
    return (true, recentlyCompletedMangas);
  }

  @override
  Future<(bool, List<Manga>)> getTrendingMangas(int page) async {
    ApiGraphQLResponse<MediaCollectionTrendingOrPopularGraphqlDtoEntity>
    trendingMediaCollection = await _anilistGraphQLService.query(
      query: queries.mediaTrendingOrPopularQuery,
      fromJson: MediaCollectionTrendingOrPopularGraphqlDtoEntity.fromJson,
      variables: {
        "sort": "TRENDING_DESC",
        "page": page,
        "perPage": 30,
        "type": "MANGA",
      },
    );
    throwIfGraphQlError(trendingMediaCollection);
    List<Manga> trendingMangas =
    trendingMediaCollection.data.page.media
        .map(
          (mediaEntry) =>
          AnilistMangaModel.fromPopularOrTrendingMediaEntry(mediaEntry),
    )
        .toList();
    return (true, trendingMangas);
  }

  @override
  Future<(bool, List<Manga>)> getUpcomingMangas(int page) async {
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
        "type" : "MANGA"
      },
    );
    throwIfGraphQlError(upcoming);
    List<Manga> upcomingMangas =
    upcoming.data.page.media
        .map((mediaEntry) => AnilistMangaModel.fromUpcomingMediaEntry(mediaEntry))
        .toList();
    return (true, upcomingMangas);
  }

  @override
  Future<List<String>> getMediaCoverImages() async {
    (bool, List<Manga>) popularMangas = await getPopularMangas(1);
    return popularMangas.$2.map((manga) => manga.coverImage).where((coverImage) => coverImage != "").shuffled(Random()).toList();
  }

  Future<(bool, MangaDetails)> getMangaDetails(Manga selectedManga, User loggedUser) async {
    Map<String, String>? graphQlHeaders = loggedUser is AnilistUserModel ? {
      "Authorization": "Bearer ${(loggedUser).accessToken}",
    }: null;
    ApiGraphQLResponse<MediaDetailsGraphqlEntity> mangaDetailsData =
    await _anilistGraphQLService.query<MediaDetailsGraphqlEntity>(
      query: queries.mediaDetailsQuery,
      fromJson: MediaDetailsGraphqlEntity.fromJson,
      variables: {
        "type": "MANGA",
        "mediaId": selectedManga.id,
        "page" : 1,
        "perPage": 20,
      },
      headers: graphQlHeaders,
    );
    throwIfGraphQlError(mangaDetailsData);
    MangaDetails mangaDetails = AnilistMangaDetailsModel.fromMangaDetailsMediaList(mangaDetailsData.data.media);
    return (true, mangaDetails);
  }
}
