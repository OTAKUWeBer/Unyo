// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeProgressModel {

@HiveField(0) int get progress;@HiveField(1) int get score;@HiveField(2) int get repeat;
/// Create a copy of AnimeProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeProgressModelCopyWith<AnimeProgressModel> get copyWith => _$AnimeProgressModelCopyWithImpl<AnimeProgressModel>(this as AnimeProgressModel, _$identity);

  /// Serializes this AnimeProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeProgressModel&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.score, score) || other.score == score)&&(identical(other.repeat, repeat) || other.repeat == repeat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progress,score,repeat);

@override
String toString() {
  return 'AnimeProgressModel(progress: $progress, score: $score, repeat: $repeat)';
}


}

/// @nodoc
abstract mixin class $AnimeProgressModelCopyWith<$Res>  {
  factory $AnimeProgressModelCopyWith(AnimeProgressModel value, $Res Function(AnimeProgressModel) _then) = _$AnimeProgressModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int progress,@HiveField(1) int score,@HiveField(2) int repeat
});




}
/// @nodoc
class _$AnimeProgressModelCopyWithImpl<$Res>
    implements $AnimeProgressModelCopyWith<$Res> {
  _$AnimeProgressModelCopyWithImpl(this._self, this._then);

  final AnimeProgressModel _self;
  final $Res Function(AnimeProgressModel) _then;

/// Create a copy of AnimeProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? progress = null,Object? score = null,Object? repeat = null,}) {
  return _then(_self.copyWith(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,repeat: null == repeat ? _self.repeat : repeat // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimeProgressModel].
extension AnimeProgressModelPatterns on AnimeProgressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeProgressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeProgressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeProgressModel value)  $default,){
final _that = this;
switch (_that) {
case _AnimeProgressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeProgressModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeProgressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  int progress, @HiveField(1)  int score, @HiveField(2)  int repeat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeProgressModel() when $default != null:
return $default(_that.progress,_that.score,_that.repeat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  int progress, @HiveField(1)  int score, @HiveField(2)  int repeat)  $default,) {final _that = this;
switch (_that) {
case _AnimeProgressModel():
return $default(_that.progress,_that.score,_that.repeat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  int progress, @HiveField(1)  int score, @HiveField(2)  int repeat)?  $default,) {final _that = this;
switch (_that) {
case _AnimeProgressModel() when $default != null:
return $default(_that.progress,_that.score,_that.repeat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeProgressModel implements AnimeProgressModel {
  const _AnimeProgressModel({@HiveField(0) required this.progress, @HiveField(1) required this.score, @HiveField(2) required this.repeat});
  factory _AnimeProgressModel.fromJson(Map<String, dynamic> json) => _$AnimeProgressModelFromJson(json);

@override@HiveField(0) final  int progress;
@override@HiveField(1) final  int score;
@override@HiveField(2) final  int repeat;

/// Create a copy of AnimeProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeProgressModelCopyWith<_AnimeProgressModel> get copyWith => __$AnimeProgressModelCopyWithImpl<_AnimeProgressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeProgressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeProgressModel&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.score, score) || other.score == score)&&(identical(other.repeat, repeat) || other.repeat == repeat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progress,score,repeat);

@override
String toString() {
  return 'AnimeProgressModel(progress: $progress, score: $score, repeat: $repeat)';
}


}

/// @nodoc
abstract mixin class _$AnimeProgressModelCopyWith<$Res> implements $AnimeProgressModelCopyWith<$Res> {
  factory _$AnimeProgressModelCopyWith(_AnimeProgressModel value, $Res Function(_AnimeProgressModel) _then) = __$AnimeProgressModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int progress,@HiveField(1) int score,@HiveField(2) int repeat
});




}
/// @nodoc
class __$AnimeProgressModelCopyWithImpl<$Res>
    implements _$AnimeProgressModelCopyWith<$Res> {
  __$AnimeProgressModelCopyWithImpl(this._self, this._then);

  final _AnimeProgressModel _self;
  final $Res Function(_AnimeProgressModel) _then;

/// Create a copy of AnimeProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? score = null,Object? repeat = null,}) {
  return _then(_AnimeProgressModel(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,repeat: null == repeat ? _self.repeat : repeat // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
