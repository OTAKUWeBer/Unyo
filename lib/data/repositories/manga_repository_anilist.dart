// External dependencies
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:logger/logger.dart';
// Internal dependencies
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/api/dto/anilist/media_advanced_search_query_graphql_entity.dart';
import 'package:unyo/core/services/api/dto/anilist/media_collection_recently_completed_graphql_entity.dart';
import 'package:unyo/core/services/api/dto/anilist/media_collection_trendingOrPopular_graphql_entity.dart';
import 'package:unyo/core/services/api/dto/anilist/media_collection_upcoming_graphql_entity.dart';
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
import 'package:unyo/presentation/widgets/text/text_utils.dart';

import '../../core/services/api/graphql/queries/anilist_queries.dart' as anilist_queries;

class MangaRepositoryAnilist with RepositoryMixin implements MangaRepository {
  final GraphQLService _anilistGraphQLService = sl<GraphQLService>(
    instanceName: config.anilistGraphQlService,
  );
  final Logger _logger = sl<Logger>();

  @override
  Future<(bool, List<Manga>)> getPopularMangas(int page, User loggedUser) async {
    ApiGraphQLResponse<MediaCollectionTrendingOrPopularGraphqlEntity>
    popularMediaCollection = await _anilistGraphQLService.query(
      query: anilist_queries.mediaTrendingOrPopularQuery,
      fromJson: MediaCollectionTrendingOrPopularGraphqlEntity.fromJson,
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
  Future<(bool, List<Manga>)> getRecentlyCompletedMangas(int page, User loggedUser) async {
    DateTime now = DateTime.now();
    DateTime monthAgo = now.subtract(const Duration(days: 30));
    ApiGraphQLResponse<MediaCollectionRecentlyCompletedGraphqlEntity>
    recentlyCompleted = await _anilistGraphQLService.query(
      query: anilist_queries.mediaRecentlyCompletedQuery,
      fromJson: MediaCollectionRecentlyCompletedGraphqlEntity.fromJson,
      variables: {
        "sort": "POPULARITY_DESC",
        "page": page,
        "perPage": 30,
        "endDateGreater": "${monthAgo.year.toString().padLeft(4, '0')}${monthAgo.month.toString().padLeft(2, '0')}${monthAgo.day.toString().padLeft(2, '0')}",
        "endDateLesser": "${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}",
        "type" : "MANGA",
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
  Future<(bool, List<Manga>)> getTrendingMangas(int page, User loggedUser) async {
    ApiGraphQLResponse<MediaCollectionTrendingOrPopularGraphqlEntity>
    trendingMediaCollection = await _anilistGraphQLService.query(
      query: anilist_queries.mediaTrendingOrPopularQuery,
      fromJson: MediaCollectionTrendingOrPopularGraphqlEntity.fromJson,
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
  Future<(bool, List<Manga>)> getUpcomingMangas(int page, User loggedUser) async {
    DateTime now = DateTime.now();
    ApiGraphQLResponse<MediaCollectionUpcomingGraphqlEntity>
    upcoming = await _anilistGraphQLService.query(
      query: anilist_queries.mediaUpcomingQuery,
      fromJson: MediaCollectionUpcomingGraphqlEntity.fromJson,
      variables: {
        "sort": "POPULARITY_DESC",
        "page": page,
        "perPage": 30,
        "startDateGreater": "${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}",
        "type" : "MANGA",
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
  Future<Map<String, (bool, List<String>)>> getUserMangaAdvancedSearchFilters() async {
    Map<String, (bool, List<String>)> filters = {};
    filters.addAll({
      'genres': (
      true,
      TextUtils.upperCaseFirstCharacter(
        AnlistGenreFilters.values.map((enumElement) => enumElement.name).toList(),
      ),
      ),
    });
    filters.addAll({
      'countriesOfOrigin': (
      true,
      TextUtils.upperCaseFirstCharacter(
        AnilistCountryOfOriginFilters.values.map((enumElement) => enumElement.name).toList(),
      ),
      ),
    });
    filters.addAll({
      'formats': (
      true,
      TextUtils.upperCaseFirstCharacter(
        AnilistFormatFilters.values.map((enumElement) => enumElement.name.replaceAll('_', ' ')).toList(),
      ),
      ),
    });
    filters.addAll({
      'publishingStatuses': (
      true,
      TextUtils.upperCaseFirstCharacter(
        AnilistPublishingStatusFilters.values
            .map((enumElement) => enumElement.name.replaceAll('_', ' '))
            .toList(),
      ),
      ),
    });
    filters.addAll({
      'years': (
      true,
      List<String>.generate(
        DateTime.now().year - 1939,
            (index) => (1940 + index).toString(),
      ).reversed.toList(),
      ),
    });
    filters.addAll({
      'sortOptions': (
      true,
      TextUtils.upperCaseFirstCharacter(
        AnilistSortOptions.values
            .map((enumElement) => enumElement.name.replaceAll('_', ' '))
            .toList(),
      ),
      ),
    });
    filters.addAll({
      'sortOrders': (
      true,
      TextUtils.upperCaseFirstCharacter(
        AnilistSortOrder.values
            .map((enumElement) => enumElement.name.replaceAll('_', ' '))
            .toList(),
      ),
      ),
    });
    return filters;
  }

  @override
  Future<List<Manga>> performMangaAdvancedSearch(
      String query,
      List<String> selectedGenres,
      String? selectedCountryOfOrigin,
      String? selectedFormat,
      int? selectedYear,
      String? selectedPublishingStatus,
      String sort,
      int page,
      User loggedUser
      ) async {
    ApiGraphQLResponse<MediaAdvancedSearchQueryGraphqlEntity> animeAdvancedSearchData =
    await _anilistGraphQLService.query<MediaAdvancedSearchQueryGraphqlEntity>(
      query: anilist_queries.mediaAdvancedSearchQuery,
      fromJson: MediaAdvancedSearchQueryGraphqlEntity.fromJson,
      variables: {
        "type": "MANGA",
        "page": 1,
        "perPage": 50,
        "sort": sort.replaceAll("_ASC", ""),
        if (query.isNotEmpty) "search": query,
        if (selectedGenres.isNotEmpty) "genres": selectedGenres,
        if (selectedCountryOfOrigin != null && selectedCountryOfOrigin.isNotEmpty) "countryOfOrigin": selectedCountryOfOrigin.toUpperCase(),
        if (selectedYear != null) "seasonYear": selectedYear,
        if (selectedPublishingStatus != null && selectedPublishingStatus.isNotEmpty)
          "status": selectedPublishingStatus.toUpperCase().replaceAll(' ', '_'),
        if (selectedFormat != null && selectedFormat.isNotEmpty)
          "format": selectedFormat.toUpperCase().replaceAll(' ', '_'),
      },
    );
    throwIfGraphQlError(animeAdvancedSearchData);
    List<Manga> searchResults =
    animeAdvancedSearchData.data.page.media
        .map((mediaEntry) => AnilistMangaModel.fromAdvancedSearchMediaEntry(mediaEntry))
        .toList();
    return searchResults;
  }

  @override
  Future<List<String>> getMediaCoverImages(User loggedUser) async {
    (bool, List<Manga>) popularMangas = await getPopularMangas(1, loggedUser);
    return popularMangas.$2.map((manga) => manga.coverImage).where((coverImage) => coverImage != "").shuffled(Random()).toList();
  }

  @override
  Future<(bool, MangaDetails)> getMangaDetails(Manga selectedManga, User loggedUser) async {
    Map<String, String>? graphQlHeaders = loggedUser is AnilistUserModel ? {
      "Authorization": "Bearer ${(loggedUser).accessToken}",
    }: null;
    ApiGraphQLResponse<MediaDetailsGraphqlEntity> mangaDetailsData =
    await _anilistGraphQLService.query<MediaDetailsGraphqlEntity>(
      query: anilist_queries.mediaDetailsQuery,
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

enum AnlistGenreFilters {
  action,
  adventure,
  comedy,
  drama,
  ecchi,
  fantasy,
  horror,
  mecha,
  music,
  mystery,
  psychological,
  romance,
  sciFi,
  sliceOfLife,
  sports,
  supernatural,
  thriller,
}

enum AnilistCountryOfOriginFilters { jp, cn, tw, kr }

enum AnilistFormatFilters { manga, light_novel, one_shot }

enum AnilistPublishingStatusFilters { releasing, finished, not_yet_released, hiatus, cancelled }

enum AnilistSortOptions { title_romaji, title_english, title_native, format, start_date, end_date, score, popularity, trending, episodes, duration, status, updated_at, favourites }

enum AnilistSortOrder { asc, desc }