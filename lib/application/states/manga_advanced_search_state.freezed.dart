// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_advanced_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MangaAdvancedSearchState {

 User get loggedUser; (bool, List<String>) get genresFilters; (bool, List<String>) get yearFilters; (bool, List<String>) get countryOfOriginsFilters; (bool, List<String>) get formatFilters; (bool, List<String>) get publishingStatusFilters; (bool, List<String>) get searchSortOptions; (bool, List<String>) get searchSortOrder; String get searchQuery; List<String> get selectedGenres; String? get selectedYear; String? get selectedCountryOfOrigin; String? get selectedFormat; String? get selectedPublishingStatus; List<Manga> get searchResults; String get selectedSearchOrder; String get selectedSearchSortOption; List<AppEffect> get effects;
/// Create a copy of MangaAdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaAdvancedSearchStateCopyWith<MangaAdvancedSearchState> get copyWith => _$MangaAdvancedSearchStateCopyWithImpl<MangaAdvancedSearchState>(this as MangaAdvancedSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaAdvancedSearchState&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.genresFilters, genresFilters) || other.genresFilters == genresFilters)&&(identical(other.yearFilters, yearFilters) || other.yearFilters == yearFilters)&&(identical(other.countryOfOriginsFilters, countryOfOriginsFilters) || other.countryOfOriginsFilters == countryOfOriginsFilters)&&(identical(other.formatFilters, formatFilters) || other.formatFilters == formatFilters)&&(identical(other.publishingStatusFilters, publishingStatusFilters) || other.publishingStatusFilters == publishingStatusFilters)&&(identical(other.searchSortOptions, searchSortOptions) || other.searchSortOptions == searchSortOptions)&&(identical(other.searchSortOrder, searchSortOrder) || other.searchSortOrder == searchSortOrder)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.selectedGenres, selectedGenres)&&(identical(other.selectedYear, selectedYear) || other.selectedYear == selectedYear)&&(identical(other.selectedCountryOfOrigin, selectedCountryOfOrigin) || other.selectedCountryOfOrigin == selectedCountryOfOrigin)&&(identical(other.selectedFormat, selectedFormat) || other.selectedFormat == selectedFormat)&&(identical(other.selectedPublishingStatus, selectedPublishingStatus) || other.selectedPublishingStatus == selectedPublishingStatus)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.selectedSearchOrder, selectedSearchOrder) || other.selectedSearchOrder == selectedSearchOrder)&&(identical(other.selectedSearchSortOption, selectedSearchSortOption) || other.selectedSearchSortOption == selectedSearchSortOption)&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,loggedUser,genresFilters,yearFilters,countryOfOriginsFilters,formatFilters,publishingStatusFilters,searchSortOptions,searchSortOrder,searchQuery,const DeepCollectionEquality().hash(selectedGenres),selectedYear,selectedCountryOfOrigin,selectedFormat,selectedPublishingStatus,const DeepCollectionEquality().hash(searchResults),selectedSearchOrder,selectedSearchSortOption,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'MangaAdvancedSearchState(loggedUser: $loggedUser, genresFilters: $genresFilters, yearFilters: $yearFilters, countryOfOriginsFilters: $countryOfOriginsFilters, formatFilters: $formatFilters, publishingStatusFilters: $publishingStatusFilters, searchSortOptions: $searchSortOptions, searchSortOrder: $searchSortOrder, searchQuery: $searchQuery, selectedGenres: $selectedGenres, selectedYear: $selectedYear, selectedCountryOfOrigin: $selectedCountryOfOrigin, selectedFormat: $selectedFormat, selectedPublishingStatus: $selectedPublishingStatus, searchResults: $searchResults, selectedSearchOrder: $selectedSearchOrder, selectedSearchSortOption: $selectedSearchSortOption, effects: $effects)';
}


}

/// @nodoc
abstract mixin class $MangaAdvancedSearchStateCopyWith<$Res>  {
  factory $MangaAdvancedSearchStateCopyWith(MangaAdvancedSearchState value, $Res Function(MangaAdvancedSearchState) _then) = _$MangaAdvancedSearchStateCopyWithImpl;
@useResult
$Res call({
 User loggedUser, (bool, List<String>) genresFilters, (bool, List<String>) yearFilters, (bool, List<String>) countryOfOriginsFilters, (bool, List<String>) formatFilters, (bool, List<String>) publishingStatusFilters, (bool, List<String>) searchSortOptions, (bool, List<String>) searchSortOrder, String searchQuery, List<String> selectedGenres, String? selectedYear, String? selectedCountryOfOrigin, String? selectedFormat, String? selectedPublishingStatus, List<Manga> searchResults, String selectedSearchOrder, String selectedSearchSortOption, List<AppEffect> effects
});




}
/// @nodoc
class _$MangaAdvancedSearchStateCopyWithImpl<$Res>
    implements $MangaAdvancedSearchStateCopyWith<$Res> {
  _$MangaAdvancedSearchStateCopyWithImpl(this._self, this._then);

  final MangaAdvancedSearchState _self;
  final $Res Function(MangaAdvancedSearchState) _then;

/// Create a copy of MangaAdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loggedUser = null,Object? genresFilters = null,Object? yearFilters = null,Object? countryOfOriginsFilters = null,Object? formatFilters = null,Object? publishingStatusFilters = null,Object? searchSortOptions = null,Object? searchSortOrder = null,Object? searchQuery = null,Object? selectedGenres = null,Object? selectedYear = freezed,Object? selectedCountryOfOrigin = freezed,Object? selectedFormat = freezed,Object? selectedPublishingStatus = freezed,Object? searchResults = null,Object? selectedSearchOrder = null,Object? selectedSearchSortOption = null,Object? effects = null,}) {
  return _then(_self.copyWith(
loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,genresFilters: null == genresFilters ? _self.genresFilters : genresFilters // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),yearFilters: null == yearFilters ? _self.yearFilters : yearFilters // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),countryOfOriginsFilters: null == countryOfOriginsFilters ? _self.countryOfOriginsFilters : countryOfOriginsFilters // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),formatFilters: null == formatFilters ? _self.formatFilters : formatFilters // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),publishingStatusFilters: null == publishingStatusFilters ? _self.publishingStatusFilters : publishingStatusFilters // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),searchSortOptions: null == searchSortOptions ? _self.searchSortOptions : searchSortOptions // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),searchSortOrder: null == searchSortOrder ? _self.searchSortOrder : searchSortOrder // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedGenres: null == selectedGenres ? _self.selectedGenres : selectedGenres // ignore: cast_nullable_to_non_nullable
as List<String>,selectedYear: freezed == selectedYear ? _self.selectedYear : selectedYear // ignore: cast_nullable_to_non_nullable
as String?,selectedCountryOfOrigin: freezed == selectedCountryOfOrigin ? _self.selectedCountryOfOrigin : selectedCountryOfOrigin // ignore: cast_nullable_to_non_nullable
as String?,selectedFormat: freezed == selectedFormat ? _self.selectedFormat : selectedFormat // ignore: cast_nullable_to_non_nullable
as String?,selectedPublishingStatus: freezed == selectedPublishingStatus ? _self.selectedPublishingStatus : selectedPublishingStatus // ignore: cast_nullable_to_non_nullable
as String?,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<Manga>,selectedSearchOrder: null == selectedSearchOrder ? _self.selectedSearchOrder : selectedSearchOrder // ignore: cast_nullable_to_non_nullable
as String,selectedSearchSortOption: null == selectedSearchSortOption ? _self.selectedSearchSortOption : selectedSearchSortOption // ignore: cast_nullable_to_non_nullable
as String,effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}

}


/// Adds pattern-matching-related methods to [MangaAdvancedSearchState].
extension MangaAdvancedSearchStatePatterns on MangaAdvancedSearchState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaAdvancedSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaAdvancedSearchState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaAdvancedSearchState value)  $default,){
final _that = this;
switch (_that) {
case _MangaAdvancedSearchState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaAdvancedSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _MangaAdvancedSearchState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User loggedUser,  (bool, List<String>) genresFilters,  (bool, List<String>) yearFilters,  (bool, List<String>) countryOfOriginsFilters,  (bool, List<String>) formatFilters,  (bool, List<String>) publishingStatusFilters,  (bool, List<String>) searchSortOptions,  (bool, List<String>) searchSortOrder,  String searchQuery,  List<String> selectedGenres,  String? selectedYear,  String? selectedCountryOfOrigin,  String? selectedFormat,  String? selectedPublishingStatus,  List<Manga> searchResults,  String selectedSearchOrder,  String selectedSearchSortOption,  List<AppEffect> effects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaAdvancedSearchState() when $default != null:
return $default(_that.loggedUser,_that.genresFilters,_that.yearFilters,_that.countryOfOriginsFilters,_that.formatFilters,_that.publishingStatusFilters,_that.searchSortOptions,_that.searchSortOrder,_that.searchQuery,_that.selectedGenres,_that.selectedYear,_that.selectedCountryOfOrigin,_that.selectedFormat,_that.selectedPublishingStatus,_that.searchResults,_that.selectedSearchOrder,_that.selectedSearchSortOption,_that.effects);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User loggedUser,  (bool, List<String>) genresFilters,  (bool, List<String>) yearFilters,  (bool, List<String>) countryOfOriginsFilters,  (bool, List<String>) formatFilters,  (bool, List<String>) publishingStatusFilters,  (bool, List<String>) searchSortOptions,  (bool, List<String>) searchSortOrder,  String searchQuery,  List<String> selectedGenres,  String? selectedYear,  String? selectedCountryOfOrigin,  String? selectedFormat,  String? selectedPublishingStatus,  List<Manga> searchResults,  String selectedSearchOrder,  String selectedSearchSortOption,  List<AppEffect> effects)  $default,) {final _that = this;
switch (_that) {
case _MangaAdvancedSearchState():
return $default(_that.loggedUser,_that.genresFilters,_that.yearFilters,_that.countryOfOriginsFilters,_that.formatFilters,_that.publishingStatusFilters,_that.searchSortOptions,_that.searchSortOrder,_that.searchQuery,_that.selectedGenres,_that.selectedYear,_that.selectedCountryOfOrigin,_that.selectedFormat,_that.selectedPublishingStatus,_that.searchResults,_that.selectedSearchOrder,_that.selectedSearchSortOption,_that.effects);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User loggedUser,  (bool, List<String>) genresFilters,  (bool, List<String>) yearFilters,  (bool, List<String>) countryOfOriginsFilters,  (bool, List<String>) formatFilters,  (bool, List<String>) publishingStatusFilters,  (bool, List<String>) searchSortOptions,  (bool, List<String>) searchSortOrder,  String searchQuery,  List<String> selectedGenres,  String? selectedYear,  String? selectedCountryOfOrigin,  String? selectedFormat,  String? selectedPublishingStatus,  List<Manga> searchResults,  String selectedSearchOrder,  String selectedSearchSortOption,  List<AppEffect> effects)?  $default,) {final _that = this;
switch (_that) {
case _MangaAdvancedSearchState() when $default != null:
return $default(_that.loggedUser,_that.genresFilters,_that.yearFilters,_that.countryOfOriginsFilters,_that.formatFilters,_that.publishingStatusFilters,_that.searchSortOptions,_that.searchSortOrder,_that.searchQuery,_that.selectedGenres,_that.selectedYear,_that.selectedCountryOfOrigin,_that.selectedFormat,_that.selectedPublishingStatus,_that.searchResults,_that.selectedSearchOrder,_that.selectedSearchSortOption,_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _MangaAdvancedSearchState extends MangaAdvancedSearchState {
  const _MangaAdvancedSearchState({required this.loggedUser, this.genresFilters = const (false, <String>[]), this.yearFilters = const (false, <String>[]), this.countryOfOriginsFilters = const (false, <String>[]), this.formatFilters = const (false, <String>[]), this.publishingStatusFilters = const (false, <String>[]), this.searchSortOptions = const (false, <String>[]), this.searchSortOrder = const (false, <String>[]), this.searchQuery = '', final  List<String> selectedGenres = const <String>[], this.selectedYear = null, this.selectedCountryOfOrigin = null, this.selectedFormat = null, this.selectedPublishingStatus = null, final  List<Manga> searchResults = const [], this.selectedSearchOrder = 'Desc', this.selectedSearchSortOption = 'Popularity', final  List<AppEffect> effects = const <AppEffect>[]}): _selectedGenres = selectedGenres,_searchResults = searchResults,_effects = effects,super._();
  

@override final  User loggedUser;
@override@JsonKey() final  (bool, List<String>) genresFilters;
@override@JsonKey() final  (bool, List<String>) yearFilters;
@override@JsonKey() final  (bool, List<String>) countryOfOriginsFilters;
@override@JsonKey() final  (bool, List<String>) formatFilters;
@override@JsonKey() final  (bool, List<String>) publishingStatusFilters;
@override@JsonKey() final  (bool, List<String>) searchSortOptions;
@override@JsonKey() final  (bool, List<String>) searchSortOrder;
@override@JsonKey() final  String searchQuery;
 final  List<String> _selectedGenres;
@override@JsonKey() List<String> get selectedGenres {
  if (_selectedGenres is EqualUnmodifiableListView) return _selectedGenres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedGenres);
}

@override@JsonKey() final  String? selectedYear;
@override@JsonKey() final  String? selectedCountryOfOrigin;
@override@JsonKey() final  String? selectedFormat;
@override@JsonKey() final  String? selectedPublishingStatus;
 final  List<Manga> _searchResults;
@override@JsonKey() List<Manga> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override@JsonKey() final  String selectedSearchOrder;
@override@JsonKey() final  String selectedSearchSortOption;
 final  List<AppEffect> _effects;
@override@JsonKey() List<AppEffect> get effects {
  if (_effects is EqualUnmodifiableListView) return _effects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_effects);
}


/// Create a copy of MangaAdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaAdvancedSearchStateCopyWith<_MangaAdvancedSearchState> get copyWith => __$MangaAdvancedSearchStateCopyWithImpl<_MangaAdvancedSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaAdvancedSearchState&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.genresFilters, genresFilters) || other.genresFilters == genresFilters)&&(identical(other.yearFilters, yearFilters) || other.yearFilters == yearFilters)&&(identical(other.countryOfOriginsFilters, countryOfOriginsFilters) || other.countryOfOriginsFilters == countryOfOriginsFilters)&&(identical(other.formatFilters, formatFilters) || other.formatFilters == formatFilters)&&(identical(other.publishingStatusFilters, publishingStatusFilters) || other.publishingStatusFilters == publishingStatusFilters)&&(identical(other.searchSortOptions, searchSortOptions) || other.searchSortOptions == searchSortOptions)&&(identical(other.searchSortOrder, searchSortOrder) || other.searchSortOrder == searchSortOrder)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._selectedGenres, _selectedGenres)&&(identical(other.selectedYear, selectedYear) || other.selectedYear == selectedYear)&&(identical(other.selectedCountryOfOrigin, selectedCountryOfOrigin) || other.selectedCountryOfOrigin == selectedCountryOfOrigin)&&(identical(other.selectedFormat, selectedFormat) || other.selectedFormat == selectedFormat)&&(identical(other.selectedPublishingStatus, selectedPublishingStatus) || other.selectedPublishingStatus == selectedPublishingStatus)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.selectedSearchOrder, selectedSearchOrder) || other.selectedSearchOrder == selectedSearchOrder)&&(identical(other.selectedSearchSortOption, selectedSearchSortOption) || other.selectedSearchSortOption == selectedSearchSortOption)&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,loggedUser,genresFilters,yearFilters,countryOfOriginsFilters,formatFilters,publishingStatusFilters,searchSortOptions,searchSortOrder,searchQuery,const DeepCollectionEquality().hash(_selectedGenres),selectedYear,selectedCountryOfOrigin,selectedFormat,selectedPublishingStatus,const DeepCollectionEquality().hash(_searchResults),selectedSearchOrder,selectedSearchSortOption,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'MangaAdvancedSearchState(loggedUser: $loggedUser, genresFilters: $genresFilters, yearFilters: $yearFilters, countryOfOriginsFilters: $countryOfOriginsFilters, formatFilters: $formatFilters, publishingStatusFilters: $publishingStatusFilters, searchSortOptions: $searchSortOptions, searchSortOrder: $searchSortOrder, searchQuery: $searchQuery, selectedGenres: $selectedGenres, selectedYear: $selectedYear, selectedCountryOfOrigin: $selectedCountryOfOrigin, selectedFormat: $selectedFormat, selectedPublishingStatus: $selectedPublishingStatus, searchResults: $searchResults, selectedSearchOrder: $selectedSearchOrder, selectedSearchSortOption: $selectedSearchSortOption, effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$MangaAdvancedSearchStateCopyWith<$Res> implements $MangaAdvancedSearchStateCopyWith<$Res> {
  factory _$MangaAdvancedSearchStateCopyWith(_MangaAdvancedSearchState value, $Res Function(_MangaAdvancedSearchState) _then) = __$MangaAdvancedSearchStateCopyWithImpl;
@override @useResult
$Res call({
 User loggedUser, (bool, List<String>) genresFilters, (bool, List<String>) yearFilters, (bool, List<String>) countryOfOriginsFilters, (bool, List<String>) formatFilters, (bool, List<String>) publishingStatusFilters, (bool, List<String>) searchSortOptions, (bool, List<String>) searchSortOrder, String searchQuery, List<String> selectedGenres, String? selectedYear, String? selectedCountryOfOrigin, String? selectedFormat, String? selectedPublishingStatus, List<Manga> searchResults, String selectedSearchOrder, String selectedSearchSortOption, List<AppEffect> effects
});




}
/// @nodoc
class __$MangaAdvancedSearchStateCopyWithImpl<$Res>
    implements _$MangaAdvancedSearchStateCopyWith<$Res> {
  __$MangaAdvancedSearchStateCopyWithImpl(this._self, this._then);

  final _MangaAdvancedSearchState _self;
  final $Res Function(_MangaAdvancedSearchState) _then;

/// Create a copy of MangaAdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loggedUser = null,Object? genresFilters = null,Object? yearFilters = null,Object? countryOfOriginsFilters = null,Object? formatFilters = null,Object? publishingStatusFilters = null,Object? searchSortOptions = null,Object? searchSortOrder = null,Object? searchQuery = null,Object? selectedGenres = null,Object? selectedYear = freezed,Object? selectedCountryOfOrigin = freezed,Object? selectedFormat = freezed,Object? selectedPublishingStatus = freezed,Object? searchResults = null,Object? selectedSearchOrder = null,Object? selectedSearchSortOption = null,Object? effects = null,}) {
  return _then(_MangaAdvancedSearchState(
loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,genresFilters: null == genresFilters ? _self.genresFilters : genresFilters // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),yearFilters: null == yearFilters ? _self.yearFilters : yearFilters // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),countryOfOriginsFilters: null == countryOfOriginsFilters ? _self.countryOfOriginsFilters : countryOfOriginsFilters // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),formatFilters: null == formatFilters ? _self.formatFilters : formatFilters // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),publishingStatusFilters: null == publishingStatusFilters ? _self.publishingStatusFilters : publishingStatusFilters // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),searchSortOptions: null == searchSortOptions ? _self.searchSortOptions : searchSortOptions // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),searchSortOrder: null == searchSortOrder ? _self.searchSortOrder : searchSortOrder // ignore: cast_nullable_to_non_nullable
as (bool, List<String>),searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedGenres: null == selectedGenres ? _self._selectedGenres : selectedGenres // ignore: cast_nullable_to_non_nullable
as List<String>,selectedYear: freezed == selectedYear ? _self.selectedYear : selectedYear // ignore: cast_nullable_to_non_nullable
as String?,selectedCountryOfOrigin: freezed == selectedCountryOfOrigin ? _self.selectedCountryOfOrigin : selectedCountryOfOrigin // ignore: cast_nullable_to_non_nullable
as String?,selectedFormat: freezed == selectedFormat ? _self.selectedFormat : selectedFormat // ignore: cast_nullable_to_non_nullable
as String?,selectedPublishingStatus: freezed == selectedPublishingStatus ? _self.selectedPublishingStatus : selectedPublishingStatus // ignore: cast_nullable_to_non_nullable
as String?,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<Manga>,selectedSearchOrder: null == selectedSearchOrder ? _self.selectedSearchOrder : selectedSearchOrder // ignore: cast_nullable_to_non_nullable
as String,selectedSearchSortOption: null == selectedSearchSortOption ? _self.selectedSearchSortOption : selectedSearchSortOption // ignore: cast_nullable_to_non_nullable
as String,effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
