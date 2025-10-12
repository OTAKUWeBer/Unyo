// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnimeDetailsState {

 User get loggedUser; MediaList get selectedMediaList; Anime get selectedAnime; int get progress; int get score; int get repeat; (bool, List<MediaCharacter>) get characters; (bool, List<Anime>) get recommendations;// relations
// voice actors
 List<AppEffect> get effects;
/// Create a copy of AnimeDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeDetailsStateCopyWith<AnimeDetailsState> get copyWith => _$AnimeDetailsStateCopyWithImpl<AnimeDetailsState>(this as AnimeDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeDetailsState&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.selectedMediaList, selectedMediaList) || other.selectedMediaList == selectedMediaList)&&(identical(other.selectedAnime, selectedAnime) || other.selectedAnime == selectedAnime)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.score, score) || other.score == score)&&(identical(other.repeat, repeat) || other.repeat == repeat)&&(identical(other.characters, characters) || other.characters == characters)&&(identical(other.recommendations, recommendations) || other.recommendations == recommendations)&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,loggedUser,selectedMediaList,selectedAnime,progress,score,repeat,characters,recommendations,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'AnimeDetailsState(loggedUser: $loggedUser, selectedMediaList: $selectedMediaList, selectedAnime: $selectedAnime, progress: $progress, score: $score, repeat: $repeat, characters: $characters, recommendations: $recommendations, effects: $effects)';
}


}

/// @nodoc
abstract mixin class $AnimeDetailsStateCopyWith<$Res>  {
  factory $AnimeDetailsStateCopyWith(AnimeDetailsState value, $Res Function(AnimeDetailsState) _then) = _$AnimeDetailsStateCopyWithImpl;
@useResult
$Res call({
 User loggedUser, MediaList selectedMediaList, Anime selectedAnime, int progress, int score, int repeat, (bool, List<MediaCharacter>) characters, (bool, List<Anime>) recommendations, List<AppEffect> effects
});




}
/// @nodoc
class _$AnimeDetailsStateCopyWithImpl<$Res>
    implements $AnimeDetailsStateCopyWith<$Res> {
  _$AnimeDetailsStateCopyWithImpl(this._self, this._then);

  final AnimeDetailsState _self;
  final $Res Function(AnimeDetailsState) _then;

/// Create a copy of AnimeDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loggedUser = null,Object? selectedMediaList = null,Object? selectedAnime = null,Object? progress = null,Object? score = null,Object? repeat = null,Object? characters = null,Object? recommendations = null,Object? effects = null,}) {
  return _then(_self.copyWith(
loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,selectedMediaList: null == selectedMediaList ? _self.selectedMediaList : selectedMediaList // ignore: cast_nullable_to_non_nullable
as MediaList,selectedAnime: null == selectedAnime ? _self.selectedAnime : selectedAnime // ignore: cast_nullable_to_non_nullable
as Anime,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,repeat: null == repeat ? _self.repeat : repeat // ignore: cast_nullable_to_non_nullable
as int,characters: null == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as (bool, List<MediaCharacter>),recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimeDetailsState].
extension AnimeDetailsStatePatterns on AnimeDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _AnimeDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User loggedUser,  MediaList selectedMediaList,  Anime selectedAnime,  int progress,  int score,  int repeat,  (bool, List<MediaCharacter>) characters,  (bool, List<Anime>) recommendations,  List<AppEffect> effects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeDetailsState() when $default != null:
return $default(_that.loggedUser,_that.selectedMediaList,_that.selectedAnime,_that.progress,_that.score,_that.repeat,_that.characters,_that.recommendations,_that.effects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User loggedUser,  MediaList selectedMediaList,  Anime selectedAnime,  int progress,  int score,  int repeat,  (bool, List<MediaCharacter>) characters,  (bool, List<Anime>) recommendations,  List<AppEffect> effects)  $default,) {final _that = this;
switch (_that) {
case _AnimeDetailsState():
return $default(_that.loggedUser,_that.selectedMediaList,_that.selectedAnime,_that.progress,_that.score,_that.repeat,_that.characters,_that.recommendations,_that.effects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User loggedUser,  MediaList selectedMediaList,  Anime selectedAnime,  int progress,  int score,  int repeat,  (bool, List<MediaCharacter>) characters,  (bool, List<Anime>) recommendations,  List<AppEffect> effects)?  $default,) {final _that = this;
switch (_that) {
case _AnimeDetailsState() when $default != null:
return $default(_that.loggedUser,_that.selectedMediaList,_that.selectedAnime,_that.progress,_that.score,_that.repeat,_that.characters,_that.recommendations,_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _AnimeDetailsState extends AnimeDetailsState {
  const _AnimeDetailsState({required this.loggedUser, required this.selectedMediaList, required this.selectedAnime, required this.progress, required this.score, required this.repeat, required this.characters, required this.recommendations, final  List<AppEffect> effects = const <AppEffect>[]}): _effects = effects,super._();
  

@override final  User loggedUser;
@override final  MediaList selectedMediaList;
@override final  Anime selectedAnime;
@override final  int progress;
@override final  int score;
@override final  int repeat;
@override final  (bool, List<MediaCharacter>) characters;
@override final  (bool, List<Anime>) recommendations;
// relations
// voice actors
 final  List<AppEffect> _effects;
// relations
// voice actors
@override@JsonKey() List<AppEffect> get effects {
  if (_effects is EqualUnmodifiableListView) return _effects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_effects);
}


/// Create a copy of AnimeDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeDetailsStateCopyWith<_AnimeDetailsState> get copyWith => __$AnimeDetailsStateCopyWithImpl<_AnimeDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeDetailsState&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.selectedMediaList, selectedMediaList) || other.selectedMediaList == selectedMediaList)&&(identical(other.selectedAnime, selectedAnime) || other.selectedAnime == selectedAnime)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.score, score) || other.score == score)&&(identical(other.repeat, repeat) || other.repeat == repeat)&&(identical(other.characters, characters) || other.characters == characters)&&(identical(other.recommendations, recommendations) || other.recommendations == recommendations)&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,loggedUser,selectedMediaList,selectedAnime,progress,score,repeat,characters,recommendations,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'AnimeDetailsState(loggedUser: $loggedUser, selectedMediaList: $selectedMediaList, selectedAnime: $selectedAnime, progress: $progress, score: $score, repeat: $repeat, characters: $characters, recommendations: $recommendations, effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$AnimeDetailsStateCopyWith<$Res> implements $AnimeDetailsStateCopyWith<$Res> {
  factory _$AnimeDetailsStateCopyWith(_AnimeDetailsState value, $Res Function(_AnimeDetailsState) _then) = __$AnimeDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 User loggedUser, MediaList selectedMediaList, Anime selectedAnime, int progress, int score, int repeat, (bool, List<MediaCharacter>) characters, (bool, List<Anime>) recommendations, List<AppEffect> effects
});




}
/// @nodoc
class __$AnimeDetailsStateCopyWithImpl<$Res>
    implements _$AnimeDetailsStateCopyWith<$Res> {
  __$AnimeDetailsStateCopyWithImpl(this._self, this._then);

  final _AnimeDetailsState _self;
  final $Res Function(_AnimeDetailsState) _then;

/// Create a copy of AnimeDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loggedUser = null,Object? selectedMediaList = null,Object? selectedAnime = null,Object? progress = null,Object? score = null,Object? repeat = null,Object? characters = null,Object? recommendations = null,Object? effects = null,}) {
  return _then(_AnimeDetailsState(
loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,selectedMediaList: null == selectedMediaList ? _self.selectedMediaList : selectedMediaList // ignore: cast_nullable_to_non_nullable
as MediaList,selectedAnime: null == selectedAnime ? _self.selectedAnime : selectedAnime // ignore: cast_nullable_to_non_nullable
as Anime,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,repeat: null == repeat ? _self.repeat : repeat // ignore: cast_nullable_to_non_nullable
as int,characters: null == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as (bool, List<MediaCharacter>),recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
