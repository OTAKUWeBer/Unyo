// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 User get loggedUser; SelectedMenuOption get selectedMenuOption; List<AppEffect> get effects;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.selectedMenuOption, selectedMenuOption) || other.selectedMenuOption == selectedMenuOption)&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,loggedUser,selectedMenuOption,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'HomeState(loggedUser: $loggedUser, selectedMenuOption: $selectedMenuOption, effects: $effects)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 User loggedUser, SelectedMenuOption selectedMenuOption, List<AppEffect> effects
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loggedUser = null,Object? selectedMenuOption = null,Object? effects = null,}) {
  return _then(_self.copyWith(
loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,selectedMenuOption: null == selectedMenuOption ? _self.selectedMenuOption : selectedMenuOption // ignore: cast_nullable_to_non_nullable
as SelectedMenuOption,effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User loggedUser,  SelectedMenuOption selectedMenuOption,  List<AppEffect> effects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.loggedUser,_that.selectedMenuOption,_that.effects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User loggedUser,  SelectedMenuOption selectedMenuOption,  List<AppEffect> effects)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.loggedUser,_that.selectedMenuOption,_that.effects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User loggedUser,  SelectedMenuOption selectedMenuOption,  List<AppEffect> effects)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.loggedUser,_that.selectedMenuOption,_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState extends HomeState {
  const _HomeState({required this.loggedUser, required this.selectedMenuOption, final  List<AppEffect> effects = const <AppEffect>[]}): _effects = effects,super._();
  

@override final  User loggedUser;
@override final  SelectedMenuOption selectedMenuOption;
 final  List<AppEffect> _effects;
@override@JsonKey() List<AppEffect> get effects {
  if (_effects is EqualUnmodifiableListView) return _effects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_effects);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.selectedMenuOption, selectedMenuOption) || other.selectedMenuOption == selectedMenuOption)&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,loggedUser,selectedMenuOption,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'HomeState(loggedUser: $loggedUser, selectedMenuOption: $selectedMenuOption, effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 User loggedUser, SelectedMenuOption selectedMenuOption, List<AppEffect> effects
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loggedUser = null,Object? selectedMenuOption = null,Object? effects = null,}) {
  return _then(_HomeState(
loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,selectedMenuOption: null == selectedMenuOption ? _self.selectedMenuOption : selectedMenuOption // ignore: cast_nullable_to_non_nullable
as SelectedMenuOption,effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
