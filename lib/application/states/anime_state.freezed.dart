// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnimeState {

 (bool, List<Anime>) get recentlyReleased; (bool, List<Anime>) get trending; (bool, List<Anime>) get recentlyCompleted; (bool, List<Anime>) get popular; (bool, List<Anime>) get upcoming; List<Anime> get banners; User get loggedUser; bool get isLoading; bool get selectionDialogLoading; bool get userLoaded; List<AppEffect> get effects;
/// Create a copy of AnimeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeStateCopyWith<AnimeState> get copyWith => _$AnimeStateCopyWithImpl<AnimeState>(this as AnimeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeState&&(identical(other.recentlyReleased, recentlyReleased) || other.recentlyReleased == recentlyReleased)&&(identical(other.trending, trending) || other.trending == trending)&&(identical(other.recentlyCompleted, recentlyCompleted) || other.recentlyCompleted == recentlyCompleted)&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&const DeepCollectionEquality().equals(other.banners, banners)&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectionDialogLoading, selectionDialogLoading) || other.selectionDialogLoading == selectionDialogLoading)&&(identical(other.userLoaded, userLoaded) || other.userLoaded == userLoaded)&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,recentlyReleased,trending,recentlyCompleted,popular,upcoming,const DeepCollectionEquality().hash(banners),loggedUser,isLoading,selectionDialogLoading,userLoaded,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'AnimeState(recentlyReleased: $recentlyReleased, trending: $trending, recentlyCompleted: $recentlyCompleted, popular: $popular, upcoming: $upcoming, banners: $banners, loggedUser: $loggedUser, isLoading: $isLoading, selectionDialogLoading: $selectionDialogLoading, userLoaded: $userLoaded, effects: $effects)';
}


}

/// @nodoc
abstract mixin class $AnimeStateCopyWith<$Res>  {
  factory $AnimeStateCopyWith(AnimeState value, $Res Function(AnimeState) _then) = _$AnimeStateCopyWithImpl;
@useResult
$Res call({
 (bool, List<Anime>) recentlyReleased, (bool, List<Anime>) trending, (bool, List<Anime>) recentlyCompleted, (bool, List<Anime>) popular, (bool, List<Anime>) upcoming, List<Anime> banners, User loggedUser, bool isLoading, bool selectionDialogLoading, bool userLoaded, List<AppEffect> effects
});




}
/// @nodoc
class _$AnimeStateCopyWithImpl<$Res>
    implements $AnimeStateCopyWith<$Res> {
  _$AnimeStateCopyWithImpl(this._self, this._then);

  final AnimeState _self;
  final $Res Function(AnimeState) _then;

/// Create a copy of AnimeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recentlyReleased = null,Object? trending = null,Object? recentlyCompleted = null,Object? popular = null,Object? upcoming = null,Object? banners = null,Object? loggedUser = null,Object? isLoading = null,Object? selectionDialogLoading = null,Object? userLoaded = null,Object? effects = null,}) {
  return _then(_self.copyWith(
recentlyReleased: null == recentlyReleased ? _self.recentlyReleased : recentlyReleased // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),trending: null == trending ? _self.trending : trending // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),recentlyCompleted: null == recentlyCompleted ? _self.recentlyCompleted : recentlyCompleted // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<Anime>,loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectionDialogLoading: null == selectionDialogLoading ? _self.selectionDialogLoading : selectionDialogLoading // ignore: cast_nullable_to_non_nullable
as bool,userLoaded: null == userLoaded ? _self.userLoaded : userLoaded // ignore: cast_nullable_to_non_nullable
as bool,effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimeState].
extension AnimeStatePatterns on AnimeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeState value)  $default,){
final _that = this;
switch (_that) {
case _AnimeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeState value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( (bool, List<Anime>) recentlyReleased,  (bool, List<Anime>) trending,  (bool, List<Anime>) recentlyCompleted,  (bool, List<Anime>) popular,  (bool, List<Anime>) upcoming,  List<Anime> banners,  User loggedUser,  bool isLoading,  bool selectionDialogLoading,  bool userLoaded,  List<AppEffect> effects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeState() when $default != null:
return $default(_that.recentlyReleased,_that.trending,_that.recentlyCompleted,_that.popular,_that.upcoming,_that.banners,_that.loggedUser,_that.isLoading,_that.selectionDialogLoading,_that.userLoaded,_that.effects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( (bool, List<Anime>) recentlyReleased,  (bool, List<Anime>) trending,  (bool, List<Anime>) recentlyCompleted,  (bool, List<Anime>) popular,  (bool, List<Anime>) upcoming,  List<Anime> banners,  User loggedUser,  bool isLoading,  bool selectionDialogLoading,  bool userLoaded,  List<AppEffect> effects)  $default,) {final _that = this;
switch (_that) {
case _AnimeState():
return $default(_that.recentlyReleased,_that.trending,_that.recentlyCompleted,_that.popular,_that.upcoming,_that.banners,_that.loggedUser,_that.isLoading,_that.selectionDialogLoading,_that.userLoaded,_that.effects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( (bool, List<Anime>) recentlyReleased,  (bool, List<Anime>) trending,  (bool, List<Anime>) recentlyCompleted,  (bool, List<Anime>) popular,  (bool, List<Anime>) upcoming,  List<Anime> banners,  User loggedUser,  bool isLoading,  bool selectionDialogLoading,  bool userLoaded,  List<AppEffect> effects)?  $default,) {final _that = this;
switch (_that) {
case _AnimeState() when $default != null:
return $default(_that.recentlyReleased,_that.trending,_that.recentlyCompleted,_that.popular,_that.upcoming,_that.banners,_that.loggedUser,_that.isLoading,_that.selectionDialogLoading,_that.userLoaded,_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _AnimeState extends AnimeState {
  const _AnimeState({required this.recentlyReleased, required this.trending, required this.recentlyCompleted, required this.popular, required this.upcoming, required final  List<Anime> banners, required this.loggedUser, required this.isLoading, required this.selectionDialogLoading, required this.userLoaded, final  List<AppEffect> effects = const <AppEffect>[]}): _banners = banners,_effects = effects,super._();
  

@override final  (bool, List<Anime>) recentlyReleased;
@override final  (bool, List<Anime>) trending;
@override final  (bool, List<Anime>) recentlyCompleted;
@override final  (bool, List<Anime>) popular;
@override final  (bool, List<Anime>) upcoming;
 final  List<Anime> _banners;
@override List<Anime> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

@override final  User loggedUser;
@override final  bool isLoading;
@override final  bool selectionDialogLoading;
@override final  bool userLoaded;
 final  List<AppEffect> _effects;
@override@JsonKey() List<AppEffect> get effects {
  if (_effects is EqualUnmodifiableListView) return _effects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_effects);
}


/// Create a copy of AnimeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeStateCopyWith<_AnimeState> get copyWith => __$AnimeStateCopyWithImpl<_AnimeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeState&&(identical(other.recentlyReleased, recentlyReleased) || other.recentlyReleased == recentlyReleased)&&(identical(other.trending, trending) || other.trending == trending)&&(identical(other.recentlyCompleted, recentlyCompleted) || other.recentlyCompleted == recentlyCompleted)&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.upcoming, upcoming) || other.upcoming == upcoming)&&const DeepCollectionEquality().equals(other._banners, _banners)&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectionDialogLoading, selectionDialogLoading) || other.selectionDialogLoading == selectionDialogLoading)&&(identical(other.userLoaded, userLoaded) || other.userLoaded == userLoaded)&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,recentlyReleased,trending,recentlyCompleted,popular,upcoming,const DeepCollectionEquality().hash(_banners),loggedUser,isLoading,selectionDialogLoading,userLoaded,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'AnimeState(recentlyReleased: $recentlyReleased, trending: $trending, recentlyCompleted: $recentlyCompleted, popular: $popular, upcoming: $upcoming, banners: $banners, loggedUser: $loggedUser, isLoading: $isLoading, selectionDialogLoading: $selectionDialogLoading, userLoaded: $userLoaded, effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$AnimeStateCopyWith<$Res> implements $AnimeStateCopyWith<$Res> {
  factory _$AnimeStateCopyWith(_AnimeState value, $Res Function(_AnimeState) _then) = __$AnimeStateCopyWithImpl;
@override @useResult
$Res call({
 (bool, List<Anime>) recentlyReleased, (bool, List<Anime>) trending, (bool, List<Anime>) recentlyCompleted, (bool, List<Anime>) popular, (bool, List<Anime>) upcoming, List<Anime> banners, User loggedUser, bool isLoading, bool selectionDialogLoading, bool userLoaded, List<AppEffect> effects
});




}
/// @nodoc
class __$AnimeStateCopyWithImpl<$Res>
    implements _$AnimeStateCopyWith<$Res> {
  __$AnimeStateCopyWithImpl(this._self, this._then);

  final _AnimeState _self;
  final $Res Function(_AnimeState) _then;

/// Create a copy of AnimeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recentlyReleased = null,Object? trending = null,Object? recentlyCompleted = null,Object? popular = null,Object? upcoming = null,Object? banners = null,Object? loggedUser = null,Object? isLoading = null,Object? selectionDialogLoading = null,Object? userLoaded = null,Object? effects = null,}) {
  return _then(_AnimeState(
recentlyReleased: null == recentlyReleased ? _self.recentlyReleased : recentlyReleased // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),trending: null == trending ? _self.trending : trending // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),recentlyCompleted: null == recentlyCompleted ? _self.recentlyCompleted : recentlyCompleted // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as (bool, List<Anime>),banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<Anime>,loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectionDialogLoading: null == selectionDialogLoading ? _self.selectionDialogLoading : selectionDialogLoading // ignore: cast_nullable_to_non_nullable
as bool,userLoaded: null == userLoaded ? _self.userLoaded : userLoaded // ignore: cast_nullable_to_non_nullable
as bool,effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
