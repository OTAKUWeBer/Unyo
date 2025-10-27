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

 List<AppEffect> get effects;
/// Create a copy of MangaAdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaAdvancedSearchStateCopyWith<MangaAdvancedSearchState> get copyWith => _$MangaAdvancedSearchStateCopyWithImpl<MangaAdvancedSearchState>(this as MangaAdvancedSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaAdvancedSearchState&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'MangaAdvancedSearchState(effects: $effects)';
}


}

/// @nodoc
abstract mixin class $MangaAdvancedSearchStateCopyWith<$Res>  {
  factory $MangaAdvancedSearchStateCopyWith(MangaAdvancedSearchState value, $Res Function(MangaAdvancedSearchState) _then) = _$MangaAdvancedSearchStateCopyWithImpl;
@useResult
$Res call({
 List<AppEffect> effects
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
@pragma('vm:prefer-inline') @override $Res call({Object? effects = null,}) {
  return _then(_self.copyWith(
effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AppEffect> effects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaAdvancedSearchState() when $default != null:
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
case _MangaAdvancedSearchState():
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
case _MangaAdvancedSearchState() when $default != null:
return $default(_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _MangaAdvancedSearchState extends MangaAdvancedSearchState {
  const _MangaAdvancedSearchState({final  List<AppEffect> effects = const <AppEffect>[]}): _effects = effects,super._();
  

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaAdvancedSearchState&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'MangaAdvancedSearchState(effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$MangaAdvancedSearchStateCopyWith<$Res> implements $MangaAdvancedSearchStateCopyWith<$Res> {
  factory _$MangaAdvancedSearchStateCopyWith(_MangaAdvancedSearchState value, $Res Function(_MangaAdvancedSearchState) _then) = __$MangaAdvancedSearchStateCopyWithImpl;
@override @useResult
$Res call({
 List<AppEffect> effects
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
@override @pragma('vm:prefer-inline') $Res call({Object? effects = null,}) {
  return _then(_MangaAdvancedSearchState(
effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
