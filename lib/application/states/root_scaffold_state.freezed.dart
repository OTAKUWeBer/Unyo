// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_scaffold_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RootScaffoldState {

 SelectedMenuOption get selectedMenuOption; bool get showMenuBar; User get loggedUser; List<AppEffect> get effects;
/// Create a copy of RootScaffoldState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RootScaffoldStateCopyWith<RootScaffoldState> get copyWith => _$RootScaffoldStateCopyWithImpl<RootScaffoldState>(this as RootScaffoldState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RootScaffoldState&&(identical(other.selectedMenuOption, selectedMenuOption) || other.selectedMenuOption == selectedMenuOption)&&(identical(other.showMenuBar, showMenuBar) || other.showMenuBar == showMenuBar)&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,selectedMenuOption,showMenuBar,loggedUser,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'RootScaffoldState(selectedMenuOption: $selectedMenuOption, showMenuBar: $showMenuBar, loggedUser: $loggedUser, effects: $effects)';
}


}

/// @nodoc
abstract mixin class $RootScaffoldStateCopyWith<$Res>  {
  factory $RootScaffoldStateCopyWith(RootScaffoldState value, $Res Function(RootScaffoldState) _then) = _$RootScaffoldStateCopyWithImpl;
@useResult
$Res call({
 SelectedMenuOption selectedMenuOption, bool showMenuBar, User loggedUser, List<AppEffect> effects
});




}
/// @nodoc
class _$RootScaffoldStateCopyWithImpl<$Res>
    implements $RootScaffoldStateCopyWith<$Res> {
  _$RootScaffoldStateCopyWithImpl(this._self, this._then);

  final RootScaffoldState _self;
  final $Res Function(RootScaffoldState) _then;

/// Create a copy of RootScaffoldState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedMenuOption = null,Object? showMenuBar = null,Object? loggedUser = null,Object? effects = null,}) {
  return _then(_self.copyWith(
selectedMenuOption: null == selectedMenuOption ? _self.selectedMenuOption : selectedMenuOption // ignore: cast_nullable_to_non_nullable
as SelectedMenuOption,showMenuBar: null == showMenuBar ? _self.showMenuBar : showMenuBar // ignore: cast_nullable_to_non_nullable
as bool,loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}

}


/// Adds pattern-matching-related methods to [RootScaffoldState].
extension RootScaffoldStatePatterns on RootScaffoldState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RootScaffoldState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RootScaffoldState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RootScaffoldState value)  $default,){
final _that = this;
switch (_that) {
case _RootScaffoldState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RootScaffoldState value)?  $default,){
final _that = this;
switch (_that) {
case _RootScaffoldState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SelectedMenuOption selectedMenuOption,  bool showMenuBar,  User loggedUser,  List<AppEffect> effects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RootScaffoldState() when $default != null:
return $default(_that.selectedMenuOption,_that.showMenuBar,_that.loggedUser,_that.effects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SelectedMenuOption selectedMenuOption,  bool showMenuBar,  User loggedUser,  List<AppEffect> effects)  $default,) {final _that = this;
switch (_that) {
case _RootScaffoldState():
return $default(_that.selectedMenuOption,_that.showMenuBar,_that.loggedUser,_that.effects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SelectedMenuOption selectedMenuOption,  bool showMenuBar,  User loggedUser,  List<AppEffect> effects)?  $default,) {final _that = this;
switch (_that) {
case _RootScaffoldState() when $default != null:
return $default(_that.selectedMenuOption,_that.showMenuBar,_that.loggedUser,_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _RootScaffoldState extends RootScaffoldState {
  const _RootScaffoldState({required this.selectedMenuOption, required this.showMenuBar, required this.loggedUser, final  List<AppEffect> effects = const <AppEffect>[]}): _effects = effects,super._();
  

@override final  SelectedMenuOption selectedMenuOption;
@override final  bool showMenuBar;
@override final  User loggedUser;
 final  List<AppEffect> _effects;
@override@JsonKey() List<AppEffect> get effects {
  if (_effects is EqualUnmodifiableListView) return _effects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_effects);
}


/// Create a copy of RootScaffoldState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RootScaffoldStateCopyWith<_RootScaffoldState> get copyWith => __$RootScaffoldStateCopyWithImpl<_RootScaffoldState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RootScaffoldState&&(identical(other.selectedMenuOption, selectedMenuOption) || other.selectedMenuOption == selectedMenuOption)&&(identical(other.showMenuBar, showMenuBar) || other.showMenuBar == showMenuBar)&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,selectedMenuOption,showMenuBar,loggedUser,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'RootScaffoldState(selectedMenuOption: $selectedMenuOption, showMenuBar: $showMenuBar, loggedUser: $loggedUser, effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$RootScaffoldStateCopyWith<$Res> implements $RootScaffoldStateCopyWith<$Res> {
  factory _$RootScaffoldStateCopyWith(_RootScaffoldState value, $Res Function(_RootScaffoldState) _then) = __$RootScaffoldStateCopyWithImpl;
@override @useResult
$Res call({
 SelectedMenuOption selectedMenuOption, bool showMenuBar, User loggedUser, List<AppEffect> effects
});




}
/// @nodoc
class __$RootScaffoldStateCopyWithImpl<$Res>
    implements _$RootScaffoldStateCopyWith<$Res> {
  __$RootScaffoldStateCopyWithImpl(this._self, this._then);

  final _RootScaffoldState _self;
  final $Res Function(_RootScaffoldState) _then;

/// Create a copy of RootScaffoldState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedMenuOption = null,Object? showMenuBar = null,Object? loggedUser = null,Object? effects = null,}) {
  return _then(_RootScaffoldState(
selectedMenuOption: null == selectedMenuOption ? _self.selectedMenuOption : selectedMenuOption // ignore: cast_nullable_to_non_nullable
as SelectedMenuOption,showMenuBar: null == showMenuBar ? _self.showMenuBar : showMenuBar // ignore: cast_nullable_to_non_nullable
as bool,loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
