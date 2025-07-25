// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MangaState {

// required (bool, List<Manga>) popular,
// required (bool, List<Manga>) trending,
// required (bool, List<Manga>) recentlyCompleted,
// required (bool, List<Manga>) upcoming,
// required List<Manga> banners,
// required User loggedUser,
// required bool isLoading,
 List<AppEffect> get effects;
/// Create a copy of MangaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaStateCopyWith<MangaState> get copyWith => _$MangaStateCopyWithImpl<MangaState>(this as MangaState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaState&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'MangaState(effects: $effects)';
}


}

/// @nodoc
abstract mixin class $MangaStateCopyWith<$Res>  {
  factory $MangaStateCopyWith(MangaState value, $Res Function(MangaState) _then) = _$MangaStateCopyWithImpl;
@useResult
$Res call({
 List<AppEffect> effects
});




}
/// @nodoc
class _$MangaStateCopyWithImpl<$Res>
    implements $MangaStateCopyWith<$Res> {
  _$MangaStateCopyWithImpl(this._self, this._then);

  final MangaState _self;
  final $Res Function(MangaState) _then;

/// Create a copy of MangaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? effects = null,}) {
  return _then(_self.copyWith(
effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}

}


/// Adds pattern-matching-related methods to [MangaState].
extension MangaStatePatterns on MangaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaState value)  $default,){
final _that = this;
switch (_that) {
case _MangaState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaState value)?  $default,){
final _that = this;
switch (_that) {
case _MangaState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AppEffect> effects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaState() when $default != null:
return $default(_that.effects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AppEffect> effects)  $default,) {final _that = this;
switch (_that) {
case _MangaState():
return $default(_that.effects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AppEffect> effects)?  $default,) {final _that = this;
switch (_that) {
case _MangaState() when $default != null:
return $default(_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _MangaState extends MangaState {
  const _MangaState({final  List<AppEffect> effects = const <AppEffect>[]}): _effects = effects,super._();
  

// required (bool, List<Manga>) popular,
// required (bool, List<Manga>) trending,
// required (bool, List<Manga>) recentlyCompleted,
// required (bool, List<Manga>) upcoming,
// required List<Manga> banners,
// required User loggedUser,
// required bool isLoading,
 final  List<AppEffect> _effects;
// required (bool, List<Manga>) popular,
// required (bool, List<Manga>) trending,
// required (bool, List<Manga>) recentlyCompleted,
// required (bool, List<Manga>) upcoming,
// required List<Manga> banners,
// required User loggedUser,
// required bool isLoading,
@override@JsonKey() List<AppEffect> get effects {
  if (_effects is EqualUnmodifiableListView) return _effects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_effects);
}


/// Create a copy of MangaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaStateCopyWith<_MangaState> get copyWith => __$MangaStateCopyWithImpl<_MangaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaState&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'MangaState(effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$MangaStateCopyWith<$Res> implements $MangaStateCopyWith<$Res> {
  factory _$MangaStateCopyWith(_MangaState value, $Res Function(_MangaState) _then) = __$MangaStateCopyWithImpl;
@override @useResult
$Res call({
 List<AppEffect> effects
});




}
/// @nodoc
class __$MangaStateCopyWithImpl<$Res>
    implements _$MangaStateCopyWith<$Res> {
  __$MangaStateCopyWithImpl(this._self, this._then);

  final _MangaState _self;
  final $Res Function(_MangaState) _then;

/// Create a copy of MangaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? effects = null,}) {
  return _then(_MangaState(
effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
