// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extensions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExtensionsState {

 List<AppEffect> get effects;
/// Create a copy of ExtensionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtensionsStateCopyWith<ExtensionsState> get copyWith => _$ExtensionsStateCopyWithImpl<ExtensionsState>(this as ExtensionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtensionsState&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'ExtensionsState(effects: $effects)';
}


}

/// @nodoc
abstract mixin class $ExtensionsStateCopyWith<$Res>  {
  factory $ExtensionsStateCopyWith(ExtensionsState value, $Res Function(ExtensionsState) _then) = _$ExtensionsStateCopyWithImpl;
@useResult
$Res call({
 List<AppEffect> effects
});




}
/// @nodoc
class _$ExtensionsStateCopyWithImpl<$Res>
    implements $ExtensionsStateCopyWith<$Res> {
  _$ExtensionsStateCopyWithImpl(this._self, this._then);

  final ExtensionsState _self;
  final $Res Function(ExtensionsState) _then;

/// Create a copy of ExtensionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? effects = null,}) {
  return _then(_self.copyWith(
effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtensionsState].
extension ExtensionsStatePatterns on ExtensionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtensionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtensionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtensionsState value)  $default,){
final _that = this;
switch (_that) {
case _ExtensionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtensionsState value)?  $default,){
final _that = this;
switch (_that) {
case _ExtensionsState() when $default != null:
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
case _ExtensionsState() when $default != null:
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
case _ExtensionsState():
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
case _ExtensionsState() when $default != null:
return $default(_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _ExtensionsState extends ExtensionsState {
  const _ExtensionsState({final  List<AppEffect> effects = const <AppEffect>[]}): _effects = effects,super._();
  

 final  List<AppEffect> _effects;
@override@JsonKey() List<AppEffect> get effects {
  if (_effects is EqualUnmodifiableListView) return _effects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_effects);
}


/// Create a copy of ExtensionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtensionsStateCopyWith<_ExtensionsState> get copyWith => __$ExtensionsStateCopyWithImpl<_ExtensionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtensionsState&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'ExtensionsState(effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$ExtensionsStateCopyWith<$Res> implements $ExtensionsStateCopyWith<$Res> {
  factory _$ExtensionsStateCopyWith(_ExtensionsState value, $Res Function(_ExtensionsState) _then) = __$ExtensionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<AppEffect> effects
});




}
/// @nodoc
class __$ExtensionsStateCopyWithImpl<$Res>
    implements _$ExtensionsStateCopyWith<$Res> {
  __$ExtensionsStateCopyWithImpl(this._self, this._then);

  final _ExtensionsState _self;
  final $Res Function(_ExtensionsState) _then;

/// Create a copy of ExtensionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? effects = null,}) {
  return _then(_ExtensionsState(
effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
