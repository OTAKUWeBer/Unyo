// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_advanced_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnimeAdvancedSearchState {

 List<AppEffect> get effects;
/// Create a copy of AnimeAdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeAdvancedSearchStateCopyWith<AnimeAdvancedSearchState> get copyWith => _$AnimeAdvancedSearchStateCopyWithImpl<AnimeAdvancedSearchState>(this as AnimeAdvancedSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeAdvancedSearchState&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'AnimeAdvancedSearchState(effects: $effects)';
}


}

/// @nodoc
abstract mixin class $AnimeAdvancedSearchStateCopyWith<$Res>  {
  factory $AnimeAdvancedSearchStateCopyWith(AnimeAdvancedSearchState value, $Res Function(AnimeAdvancedSearchState) _then) = _$AnimeAdvancedSearchStateCopyWithImpl;
@useResult
$Res call({
 List<AppEffect> effects
});




}
/// @nodoc
class _$AnimeAdvancedSearchStateCopyWithImpl<$Res>
    implements $AnimeAdvancedSearchStateCopyWith<$Res> {
  _$AnimeAdvancedSearchStateCopyWithImpl(this._self, this._then);

  final AnimeAdvancedSearchState _self;
  final $Res Function(AnimeAdvancedSearchState) _then;

/// Create a copy of AnimeAdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? effects = null,}) {
  return _then(_self.copyWith(
effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimeAdvancedSearchState].
extension AnimeAdvancedSearchStatePatterns on AnimeAdvancedSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeAdvancedSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeAdvancedSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeAdvancedSearchState value)  $default,){
final _that = this;
switch (_that) {
case _AnimeAdvancedSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeAdvancedSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeAdvancedSearchState() when $default != null:
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
case _AnimeAdvancedSearchState() when $default != null:
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
case _AnimeAdvancedSearchState():
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
case _AnimeAdvancedSearchState() when $default != null:
return $default(_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _AnimeAdvancedSearchState extends AnimeAdvancedSearchState {
  const _AnimeAdvancedSearchState({final  List<AppEffect> effects = const <AppEffect>[]}): _effects = effects,super._();
  

 final  List<AppEffect> _effects;
@override@JsonKey() List<AppEffect> get effects {
  if (_effects is EqualUnmodifiableListView) return _effects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_effects);
}


/// Create a copy of AnimeAdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeAdvancedSearchStateCopyWith<_AnimeAdvancedSearchState> get copyWith => __$AnimeAdvancedSearchStateCopyWithImpl<_AnimeAdvancedSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeAdvancedSearchState&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'AnimeAdvancedSearchState(effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$AnimeAdvancedSearchStateCopyWith<$Res> implements $AnimeAdvancedSearchStateCopyWith<$Res> {
  factory _$AnimeAdvancedSearchStateCopyWith(_AnimeAdvancedSearchState value, $Res Function(_AnimeAdvancedSearchState) _then) = __$AnimeAdvancedSearchStateCopyWithImpl;
@override @useResult
$Res call({
 List<AppEffect> effects
});




}
/// @nodoc
class __$AnimeAdvancedSearchStateCopyWithImpl<$Res>
    implements _$AnimeAdvancedSearchStateCopyWith<$Res> {
  __$AnimeAdvancedSearchStateCopyWithImpl(this._self, this._then);

  final _AnimeAdvancedSearchState _self;
  final $Res Function(_AnimeAdvancedSearchState) _then;

/// Create a copy of AnimeAdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? effects = null,}) {
  return _then(_AnimeAdvancedSearchState(
effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
