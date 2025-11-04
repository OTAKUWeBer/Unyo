import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/user.dart';

part 'manga_advanced_search_state.freezed.dart';

@freezed
abstract class MangaAdvancedSearchState with _$MangaAdvancedSearchState implements HasEffects {
  const factory MangaAdvancedSearchState({
    required User loggedUser,
    @Default((false, <String>[])) (bool, List<String>) genresFilters,
    @Default((false, <String>[])) (bool, List<String>) yearFilters,
    @Default((false, <String>[])) (bool, List<String>) countryOfOriginsFilters,
    @Default((false, <String>[])) (bool, List<String>) formatFilters,
    @Default((false, <String>[])) (bool, List<String>) publishingStatusFilters,
    @Default((false, <String>[])) (bool, List<String>) searchSortOptions,
    @Default((false, <String>[])) (bool, List<String>) searchSortOrder,
    @Default('') String searchQuery,
    @Default(<String>[]) List<String> selectedGenres,
    @Default(null) String? selectedYear,
    @Default(null) String? selectedCountryOfOrigin,
    @Default(null) String? selectedFormat,
    @Default(null) String? selectedPublishingStatus,
    @Default([]) List<Manga> searchResults,
    @Default('Desc') String selectedSearchOrder,
    @Default('Popularity') String selectedSearchSortOption,
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _MangaAdvancedSearchState;

  const MangaAdvancedSearchState._();

  @override
  List<AppEffect> get stateEffects => effects;
}