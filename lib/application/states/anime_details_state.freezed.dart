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

 User get loggedUser; Anime get selectedAnime;// relations
// characters
// voice actors
 (bool, List<Anime>) get recommendations; AnimeProgress get animeProgress; List<AppEffect> get effects;
/// Create a copy of AnimeDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeDetailsStateCopyWith<AnimeDetailsState> get copyWith => _$AnimeDetailsStateCopyWithImpl<AnimeDetailsState>(this as AnimeDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeDetailsState&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.selectedAnime, selectedAnime) || other.selectedAnime == selectedAnime)&&(identical(other.recommendations, recommendations) || other.recommendations == recommendations)&&(identical(other.animeProgress, animeProgress) || other.animeProgress == animeProgress)&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,loggedUser,selectedAnime,recommendations,animeProgress,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'AnimeDetailsState(loggedUser: $loggedUser, selectedAnime: $selectedAnime, recommendations: $recommendations, animeProgress: $animeProgress, effects: $effects)';
}


}

/// @nodoc
abstract mixin class $AnimeDetailsStateCopyWith<$Res>  {
  factory $AnimeDetailsStateCopyWith(AnimeDetailsState value, $Res Function(AnimeDetailsState) _then) = _$AnimeDetailsStateCopyWithImpl;
@useResult
$Res call({
 User loggedUser, Anime selectedAnime, (bool, List<Anime>) recommendations, AnimeProgress animeProgress, List<AppEffect> effects
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
@pragma('vm:prefer-inline') @override $Res call({Object? loggedUser = null,Object? selectedAnime = null,Object? recommendations = null,Object? animeProgress = null,Object? effects = null,}) {
  return _then(_self.copyWith(
loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,selectedAnime: null == selectedAnime ? _self.selectedAnime : selectedAnime // ignore: cast_nullable_to_non_nullable
as Anime,recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),animeProgress: null == animeProgress ? _self.animeProgress : animeProgress // ignore: cast_nullable_to_non_nullable
as AnimeProgress,effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User loggedUser,  Anime selectedAnime,  (bool, List<Anime>) recommendations,  AnimeProgress animeProgress,  List<AppEffect> effects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeDetailsState() when $default != null:
return $default(_that.loggedUser,_that.selectedAnime,_that.recommendations,_that.animeProgress,_that.effects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User loggedUser,  Anime selectedAnime,  (bool, List<Anime>) recommendations,  AnimeProgress animeProgress,  List<AppEffect> effects)  $default,) {final _that = this;
switch (_that) {
case _AnimeDetailsState():
return $default(_that.loggedUser,_that.selectedAnime,_that.recommendations,_that.animeProgress,_that.effects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User loggedUser,  Anime selectedAnime,  (bool, List<Anime>) recommendations,  AnimeProgress animeProgress,  List<AppEffect> effects)?  $default,) {final _that = this;
switch (_that) {
case _AnimeDetailsState() when $default != null:
return $default(_that.loggedUser,_that.selectedAnime,_that.recommendations,_that.animeProgress,_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _AnimeDetailsState extends AnimeDetailsState {
  const _AnimeDetailsState({required this.loggedUser, required this.selectedAnime, required this.recommendations, required this.animeProgress, final  List<AppEffect> effects = const <AppEffect>[]}): _effects = effects,super._();
  

@override final  User loggedUser;
@override final  Anime selectedAnime;
// relations
// characters
// voice actors
@override final  (bool, List<Anime>) recommendations;
@override final  AnimeProgress animeProgress;
 final  List<AppEffect> _effects;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeDetailsState&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.selectedAnime, selectedAnime) || other.selectedAnime == selectedAnime)&&(identical(other.recommendations, recommendations) || other.recommendations == recommendations)&&(identical(other.animeProgress, animeProgress) || other.animeProgress == animeProgress)&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,loggedUser,selectedAnime,recommendations,animeProgress,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'AnimeDetailsState(loggedUser: $loggedUser, selectedAnime: $selectedAnime, recommendations: $recommendations, animeProgress: $animeProgress, effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$AnimeDetailsStateCopyWith<$Res> implements $AnimeDetailsStateCopyWith<$Res> {
  factory _$AnimeDetailsStateCopyWith(_AnimeDetailsState value, $Res Function(_AnimeDetailsState) _then) = __$AnimeDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 User loggedUser, Anime selectedAnime, (bool, List<Anime>) recommendations, AnimeProgress animeProgress, List<AppEffect> effects
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
@override @pragma('vm:prefer-inline') $Res call({Object? loggedUser = null,Object? selectedAnime = null,Object? recommendations = null,Object? animeProgress = null,Object? effects = null,}) {
  return _then(_AnimeDetailsState(
loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,selectedAnime: null == selectedAnime ? _self.selectedAnime : selectedAnime // ignore: cast_nullable_to_non_nullable
as Anime,recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),animeProgress: null == animeProgress ? _self.animeProgress : animeProgress // ignore: cast_nullable_to_non_nullable
as AnimeProgress,effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
