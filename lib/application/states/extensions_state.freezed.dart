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

 User get loggedUser; List<Extension> get installedAnimeExtensions; List<Extension> get installedMangaExtensions; List<Extension> get availableAnimeExtensions; List<Extension> get availableMangaExtensions; bool get userLoaded; List<AppEffect> get effects;
/// Create a copy of ExtensionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtensionsStateCopyWith<ExtensionsState> get copyWith => _$ExtensionsStateCopyWithImpl<ExtensionsState>(this as ExtensionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtensionsState&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&const DeepCollectionEquality().equals(other.installedAnimeExtensions, installedAnimeExtensions)&&const DeepCollectionEquality().equals(other.installedMangaExtensions, installedMangaExtensions)&&const DeepCollectionEquality().equals(other.availableAnimeExtensions, availableAnimeExtensions)&&const DeepCollectionEquality().equals(other.availableMangaExtensions, availableMangaExtensions)&&(identical(other.userLoaded, userLoaded) || other.userLoaded == userLoaded)&&const DeepCollectionEquality().equals(other.effects, effects));
}


@override
int get hashCode => Object.hash(runtimeType,loggedUser,const DeepCollectionEquality().hash(installedAnimeExtensions),const DeepCollectionEquality().hash(installedMangaExtensions),const DeepCollectionEquality().hash(availableAnimeExtensions),const DeepCollectionEquality().hash(availableMangaExtensions),userLoaded,const DeepCollectionEquality().hash(effects));

@override
String toString() {
  return 'ExtensionsState(loggedUser: $loggedUser, installedAnimeExtensions: $installedAnimeExtensions, installedMangaExtensions: $installedMangaExtensions, availableAnimeExtensions: $availableAnimeExtensions, availableMangaExtensions: $availableMangaExtensions, userLoaded: $userLoaded, effects: $effects)';
}


}

/// @nodoc
abstract mixin class $ExtensionsStateCopyWith<$Res>  {
  factory $ExtensionsStateCopyWith(ExtensionsState value, $Res Function(ExtensionsState) _then) = _$ExtensionsStateCopyWithImpl;
@useResult
$Res call({
 User loggedUser, List<Extension> installedAnimeExtensions, List<Extension> installedMangaExtensions, List<Extension> availableAnimeExtensions, List<Extension> availableMangaExtensions, bool userLoaded, List<AppEffect> effects
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
@pragma('vm:prefer-inline') @override $Res call({Object? loggedUser = null,Object? installedAnimeExtensions = null,Object? installedMangaExtensions = null,Object? availableAnimeExtensions = null,Object? availableMangaExtensions = null,Object? userLoaded = null,Object? effects = null,}) {
  return _then(_self.copyWith(
loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,installedAnimeExtensions: null == installedAnimeExtensions ? _self.installedAnimeExtensions : installedAnimeExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,installedMangaExtensions: null == installedMangaExtensions ? _self.installedMangaExtensions : installedMangaExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,availableAnimeExtensions: null == availableAnimeExtensions ? _self.availableAnimeExtensions : availableAnimeExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,availableMangaExtensions: null == availableMangaExtensions ? _self.availableMangaExtensions : availableMangaExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,userLoaded: null == userLoaded ? _self.userLoaded : userLoaded // ignore: cast_nullable_to_non_nullable
as bool,effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User loggedUser,  List<Extension> installedAnimeExtensions,  List<Extension> installedMangaExtensions,  List<Extension> availableAnimeExtensions,  List<Extension> availableMangaExtensions,  bool userLoaded,  List<AppEffect> effects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtensionsState() when $default != null:
return $default(_that.loggedUser,_that.installedAnimeExtensions,_that.installedMangaExtensions,_that.availableAnimeExtensions,_that.availableMangaExtensions,_that.userLoaded,_that.effects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User loggedUser,  List<Extension> installedAnimeExtensions,  List<Extension> installedMangaExtensions,  List<Extension> availableAnimeExtensions,  List<Extension> availableMangaExtensions,  bool userLoaded,  List<AppEffect> effects)  $default,) {final _that = this;
switch (_that) {
case _ExtensionsState():
return $default(_that.loggedUser,_that.installedAnimeExtensions,_that.installedMangaExtensions,_that.availableAnimeExtensions,_that.availableMangaExtensions,_that.userLoaded,_that.effects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User loggedUser,  List<Extension> installedAnimeExtensions,  List<Extension> installedMangaExtensions,  List<Extension> availableAnimeExtensions,  List<Extension> availableMangaExtensions,  bool userLoaded,  List<AppEffect> effects)?  $default,) {final _that = this;
switch (_that) {
case _ExtensionsState() when $default != null:
return $default(_that.loggedUser,_that.installedAnimeExtensions,_that.installedMangaExtensions,_that.availableAnimeExtensions,_that.availableMangaExtensions,_that.userLoaded,_that.effects);case _:
  return null;

}
}

}

/// @nodoc


class _ExtensionsState extends ExtensionsState {
  const _ExtensionsState({required this.loggedUser, required final  List<Extension> installedAnimeExtensions, required final  List<Extension> installedMangaExtensions, required final  List<Extension> availableAnimeExtensions, required final  List<Extension> availableMangaExtensions, required this.userLoaded, final  List<AppEffect> effects = const <AppEffect>[]}): _installedAnimeExtensions = installedAnimeExtensions,_installedMangaExtensions = installedMangaExtensions,_availableAnimeExtensions = availableAnimeExtensions,_availableMangaExtensions = availableMangaExtensions,_effects = effects,super._();
  

@override final  User loggedUser;
 final  List<Extension> _installedAnimeExtensions;
@override List<Extension> get installedAnimeExtensions {
  if (_installedAnimeExtensions is EqualUnmodifiableListView) return _installedAnimeExtensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedAnimeExtensions);
}

 final  List<Extension> _installedMangaExtensions;
@override List<Extension> get installedMangaExtensions {
  if (_installedMangaExtensions is EqualUnmodifiableListView) return _installedMangaExtensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedMangaExtensions);
}

 final  List<Extension> _availableAnimeExtensions;
@override List<Extension> get availableAnimeExtensions {
  if (_availableAnimeExtensions is EqualUnmodifiableListView) return _availableAnimeExtensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableAnimeExtensions);
}

 final  List<Extension> _availableMangaExtensions;
@override List<Extension> get availableMangaExtensions {
  if (_availableMangaExtensions is EqualUnmodifiableListView) return _availableMangaExtensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableMangaExtensions);
}

@override final  bool userLoaded;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtensionsState&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&const DeepCollectionEquality().equals(other._installedAnimeExtensions, _installedAnimeExtensions)&&const DeepCollectionEquality().equals(other._installedMangaExtensions, _installedMangaExtensions)&&const DeepCollectionEquality().equals(other._availableAnimeExtensions, _availableAnimeExtensions)&&const DeepCollectionEquality().equals(other._availableMangaExtensions, _availableMangaExtensions)&&(identical(other.userLoaded, userLoaded) || other.userLoaded == userLoaded)&&const DeepCollectionEquality().equals(other._effects, _effects));
}


@override
int get hashCode => Object.hash(runtimeType,loggedUser,const DeepCollectionEquality().hash(_installedAnimeExtensions),const DeepCollectionEquality().hash(_installedMangaExtensions),const DeepCollectionEquality().hash(_availableAnimeExtensions),const DeepCollectionEquality().hash(_availableMangaExtensions),userLoaded,const DeepCollectionEquality().hash(_effects));

@override
String toString() {
  return 'ExtensionsState(loggedUser: $loggedUser, installedAnimeExtensions: $installedAnimeExtensions, installedMangaExtensions: $installedMangaExtensions, availableAnimeExtensions: $availableAnimeExtensions, availableMangaExtensions: $availableMangaExtensions, userLoaded: $userLoaded, effects: $effects)';
}


}

/// @nodoc
abstract mixin class _$ExtensionsStateCopyWith<$Res> implements $ExtensionsStateCopyWith<$Res> {
  factory _$ExtensionsStateCopyWith(_ExtensionsState value, $Res Function(_ExtensionsState) _then) = __$ExtensionsStateCopyWithImpl;
@override @useResult
$Res call({
 User loggedUser, List<Extension> installedAnimeExtensions, List<Extension> installedMangaExtensions, List<Extension> availableAnimeExtensions, List<Extension> availableMangaExtensions, bool userLoaded, List<AppEffect> effects
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
@override @pragma('vm:prefer-inline') $Res call({Object? loggedUser = null,Object? installedAnimeExtensions = null,Object? installedMangaExtensions = null,Object? availableAnimeExtensions = null,Object? availableMangaExtensions = null,Object? userLoaded = null,Object? effects = null,}) {
  return _then(_ExtensionsState(
loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as User,installedAnimeExtensions: null == installedAnimeExtensions ? _self._installedAnimeExtensions : installedAnimeExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,installedMangaExtensions: null == installedMangaExtensions ? _self._installedMangaExtensions : installedMangaExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,availableAnimeExtensions: null == availableAnimeExtensions ? _self._availableAnimeExtensions : availableAnimeExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,availableMangaExtensions: null == availableMangaExtensions ? _self._availableMangaExtensions : availableMangaExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,userLoaded: null == userLoaded ? _self.userLoaded : userLoaded // ignore: cast_nullable_to_non_nullable
as bool,effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AppEffect>,
  ));
}


}

// dart format on
