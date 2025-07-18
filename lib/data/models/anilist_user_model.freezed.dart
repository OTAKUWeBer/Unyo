// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anilist_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnilistUserModel {

 String get name; String get avatarImage; String get accessCode; String get accessToken; String get refreshToken;
/// Create a copy of AnilistUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistUserModelCopyWith<AnilistUserModel> get copyWith => _$AnilistUserModelCopyWithImpl<AnilistUserModel>(this as AnilistUserModel, _$identity);

  /// Serializes this AnilistUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistUserModel&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarImage, avatarImage) || other.avatarImage == avatarImage)&&(identical(other.accessCode, accessCode) || other.accessCode == accessCode)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,avatarImage,accessCode,accessToken,refreshToken);

@override
String toString() {
  return 'AnilistUserModel(name: $name, avatarImage: $avatarImage, accessCode: $accessCode, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $AnilistUserModelCopyWith<$Res>  {
  factory $AnilistUserModelCopyWith(AnilistUserModel value, $Res Function(AnilistUserModel) _then) = _$AnilistUserModelCopyWithImpl;
@useResult
$Res call({
 String name, String avatarImage, String accessCode, String accessToken, String refreshToken
});




}
/// @nodoc
class _$AnilistUserModelCopyWithImpl<$Res>
    implements $AnilistUserModelCopyWith<$Res> {
  _$AnilistUserModelCopyWithImpl(this._self, this._then);

  final AnilistUserModel _self;
  final $Res Function(AnilistUserModel) _then;

/// Create a copy of AnilistUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? avatarImage = null,Object? accessCode = null,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarImage: null == avatarImage ? _self.avatarImage : avatarImage // ignore: cast_nullable_to_non_nullable
as String,accessCode: null == accessCode ? _self.accessCode : accessCode // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AnilistUserModel].
extension AnilistUserModelPatterns on AnilistUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistUserModel value)  $default,){
final _that = this;
switch (_that) {
case _AnilistUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String avatarImage,  String accessCode,  String accessToken,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistUserModel() when $default != null:
return $default(_that.name,_that.avatarImage,_that.accessCode,_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String avatarImage,  String accessCode,  String accessToken,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _AnilistUserModel():
return $default(_that.name,_that.avatarImage,_that.accessCode,_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String avatarImage,  String accessCode,  String accessToken,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _AnilistUserModel() when $default != null:
return $default(_that.name,_that.avatarImage,_that.accessCode,_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistUserModel extends AnilistUserModel {
  const _AnilistUserModel({required this.name, required this.avatarImage, required this.accessCode, required this.accessToken, required this.refreshToken}): super._();
  factory _AnilistUserModel.fromJson(Map<String, dynamic> json) => _$AnilistUserModelFromJson(json);

@override final  String name;
@override final  String avatarImage;
@override final  String accessCode;
@override final  String accessToken;
@override final  String refreshToken;

/// Create a copy of AnilistUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistUserModelCopyWith<_AnilistUserModel> get copyWith => __$AnilistUserModelCopyWithImpl<_AnilistUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistUserModel&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarImage, avatarImage) || other.avatarImage == avatarImage)&&(identical(other.accessCode, accessCode) || other.accessCode == accessCode)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,avatarImage,accessCode,accessToken,refreshToken);

@override
String toString() {
  return 'AnilistUserModel(name: $name, avatarImage: $avatarImage, accessCode: $accessCode, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$AnilistUserModelCopyWith<$Res> implements $AnilistUserModelCopyWith<$Res> {
  factory _$AnilistUserModelCopyWith(_AnilistUserModel value, $Res Function(_AnilistUserModel) _then) = __$AnilistUserModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String avatarImage, String accessCode, String accessToken, String refreshToken
});




}
/// @nodoc
class __$AnilistUserModelCopyWithImpl<$Res>
    implements _$AnilistUserModelCopyWith<$Res> {
  __$AnilistUserModelCopyWithImpl(this._self, this._then);

  final _AnilistUserModel _self;
  final $Res Function(_AnilistUserModel) _then;

/// Create a copy of AnilistUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? avatarImage = null,Object? accessCode = null,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_AnilistUserModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarImage: null == avatarImage ? _self.avatarImage : avatarImage // ignore: cast_nullable_to_non_nullable
as String,accessCode: null == accessCode ? _self.accessCode : accessCode // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
