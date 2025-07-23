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

 List<Anime> get recentlyReleased;// required List<Manga> continueReading,
// required bool isLoading,
 List<AppEffect> get effects;
/// Create a copy of AnimeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeStateCopyWith<AnimeState> get copyWith => _$AnimeStateCopyWithImpl<AnimeState>(this as AnimeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeState&&const DeepCollectionEquality().equals(other.recentlyReleased, recentlyReleased)&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recentlyReleased),const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'AnimeState(recentlyReleased: $recentlyReleased, effects: $effects)';
}


}

/// @nodoc
abstract mixin class $AnimeStateCopyWith<$Res>  {
  factory $AnimeStateCopyWith(AnimeState value, $Res Function(AnimeState) _then) = _$AnimeStateCopyWithImpl;
@useResult
$Res call({
 List<Anime> recentlyReleased, List<AppEffect> effects
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
@pragma('vm:prefer-inline') @override $Res call({Object? recentlyReleased = null,Object? effects = null,}) {
  return _then(_self.copyWith(
recentlyReleased: null == recentlyReleased ? _self.recentlyReleased : recentlyReleased // ignore: cast_nullable_to_non_nullable
as List<Anime>,effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Anime> recentlyReleased,  List<AppEffect> effects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeState() when $default != null:
return $default(_that.recentlyReleased,_that.effects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Anime> recentlyReleased,  List<AppEffect> effects)  $default,) {final _that = this;
switch (_that) {
case _AnimeState():
return $default(_that.recentlyReleased,_that.effects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Anime> recentlyReleased,  List<AppEffect> effects)?  $default,) {final _that = this;
switch (_that) {
case _AnimeState() when $default != null:
return $default(_that.recentlyReleased,_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _AnimeState extends AnimeState {
  const _AnimeState({required final  List<Anime> recentlyReleased, final  List<AppEffect> effects = const <AppEffect>[]}): _recentlyReleased = recentlyReleased,_effects = effects,super._();
  

 final  List<Anime> _recentlyReleased;
@override List<Anime> get recentlyReleased {
  if (_recentlyReleased is EqualUnmodifiableListView) return _recentlyReleased;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentlyReleased);
}

// required List<Manga> continueReading,
// required bool isLoading,
 final  List<AppEffect> _effects;
// required List<Manga> continueReading,
// required bool isLoading,
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeState&&const DeepCollectionEquality().equals(other._recentlyReleased, _recentlyReleased)&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recentlyReleased),const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'AnimeState(recentlyReleased: $recentlyReleased, effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$AnimeStateCopyWith<$Res> implements $AnimeStateCopyWith<$Res> {
  factory _$AnimeStateCopyWith(_AnimeState value, $Res Function(_AnimeState) _then) = __$AnimeStateCopyWithImpl;
@override @useResult
$Res call({
 List<Anime> recentlyReleased, List<AppEffect> effects
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
@override @pragma('vm:prefer-inline') $Res call({Object? recentlyReleased = null,Object? effects = null,}) {
  return _then(_AnimeState(
recentlyReleased: null == recentlyReleased ? _self._recentlyReleased : recentlyReleased // ignore: cast_nullable_to_non_nullable
as List<Anime>,effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
