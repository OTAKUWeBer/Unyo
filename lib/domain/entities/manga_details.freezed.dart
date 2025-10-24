// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MangaDetailsModel {

 int get progress; int get score; int get repeat;@MangaConverter() List<Manga> get recommendedMangas;@MediaCharacterConverter() List<MediaCharacter> get characters;
/// Create a copy of MangaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaDetailsModelCopyWith<MangaDetailsModel> get copyWith => _$MangaDetailsModelCopyWithImpl<MangaDetailsModel>(this as MangaDetailsModel, _$identity);

  /// Serializes this MangaDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaDetailsModel&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.score, score) || other.score == score)&&(identical(other.repeat, repeat) || other.repeat == repeat)&&const DeepCollectionEquality().equals(other.recommendedMangas, recommendedMangas)&&const DeepCollectionEquality().equals(other.characters, characters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progress,score,repeat,const DeepCollectionEquality().hash(recommendedMangas),const DeepCollectionEquality().hash(characters));

@override
String toString() {
  return 'MangaDetailsModel(progress: $progress, score: $score, repeat: $repeat, recommendedMangas: $recommendedMangas, characters: $characters)';
}


}

/// @nodoc
abstract mixin class $MangaDetailsModelCopyWith<$Res>  {
  factory $MangaDetailsModelCopyWith(MangaDetailsModel value, $Res Function(MangaDetailsModel) _then) = _$MangaDetailsModelCopyWithImpl;
@useResult
$Res call({
 int progress, int score, int repeat,@MangaConverter() List<Manga> recommendedMangas,@MediaCharacterConverter() List<MediaCharacter> characters
});




}
/// @nodoc
class _$MangaDetailsModelCopyWithImpl<$Res>
    implements $MangaDetailsModelCopyWith<$Res> {
  _$MangaDetailsModelCopyWithImpl(this._self, this._then);

  final MangaDetailsModel _self;
  final $Res Function(MangaDetailsModel) _then;

/// Create a copy of MangaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? progress = null,Object? score = null,Object? repeat = null,Object? recommendedMangas = null,Object? characters = null,}) {
  return _then(_self.copyWith(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,repeat: null == repeat ? _self.repeat : repeat // ignore: cast_nullable_to_non_nullable
as int,recommendedMangas: null == recommendedMangas ? _self.recommendedMangas : recommendedMangas // ignore: cast_nullable_to_non_nullable
as List<Manga>,characters: null == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as List<MediaCharacter>,
  ));
}

}


/// Adds pattern-matching-related methods to [MangaDetailsModel].
extension MangaDetailsModelPatterns on MangaDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _MangaDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _MangaDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int progress,  int score,  int repeat, @MangaConverter()  List<Manga> recommendedMangas, @MediaCharacterConverter()  List<MediaCharacter> characters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaDetailsModel() when $default != null:
return $default(_that.progress,_that.score,_that.repeat,_that.recommendedMangas,_that.characters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int progress,  int score,  int repeat, @MangaConverter()  List<Manga> recommendedMangas, @MediaCharacterConverter()  List<MediaCharacter> characters)  $default,) {final _that = this;
switch (_that) {
case _MangaDetailsModel():
return $default(_that.progress,_that.score,_that.repeat,_that.recommendedMangas,_that.characters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int progress,  int score,  int repeat, @MangaConverter()  List<Manga> recommendedMangas, @MediaCharacterConverter()  List<MediaCharacter> characters)?  $default,) {final _that = this;
switch (_that) {
case _MangaDetailsModel() when $default != null:
return $default(_that.progress,_that.score,_that.repeat,_that.recommendedMangas,_that.characters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MangaDetailsModel implements MangaDetailsModel {
  const _MangaDetailsModel({required this.progress, required this.score, required this.repeat, @MangaConverter() required final  List<Manga> recommendedMangas, @MediaCharacterConverter() required final  List<MediaCharacter> characters}): _recommendedMangas = recommendedMangas,_characters = characters;
  factory _MangaDetailsModel.fromJson(Map<String, dynamic> json) => _$MangaDetailsModelFromJson(json);

@override final  int progress;
@override final  int score;
@override final  int repeat;
 final  List<Manga> _recommendedMangas;
@override@MangaConverter() List<Manga> get recommendedMangas {
  if (_recommendedMangas is EqualUnmodifiableListView) return _recommendedMangas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendedMangas);
}

 final  List<MediaCharacter> _characters;
@override@MediaCharacterConverter() List<MediaCharacter> get characters {
  if (_characters is EqualUnmodifiableListView) return _characters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_characters);
}


/// Create a copy of MangaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaDetailsModelCopyWith<_MangaDetailsModel> get copyWith => __$MangaDetailsModelCopyWithImpl<_MangaDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaDetailsModel&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.score, score) || other.score == score)&&(identical(other.repeat, repeat) || other.repeat == repeat)&&const DeepCollectionEquality().equals(other._recommendedMangas, _recommendedMangas)&&const DeepCollectionEquality().equals(other._characters, _characters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progress,score,repeat,const DeepCollectionEquality().hash(_recommendedMangas),const DeepCollectionEquality().hash(_characters));

@override
String toString() {
  return 'MangaDetailsModel(progress: $progress, score: $score, repeat: $repeat, recommendedMangas: $recommendedMangas, characters: $characters)';
}


}

/// @nodoc
abstract mixin class _$MangaDetailsModelCopyWith<$Res> implements $MangaDetailsModelCopyWith<$Res> {
  factory _$MangaDetailsModelCopyWith(_MangaDetailsModel value, $Res Function(_MangaDetailsModel) _then) = __$MangaDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 int progress, int score, int repeat,@MangaConverter() List<Manga> recommendedMangas,@MediaCharacterConverter() List<MediaCharacter> characters
});




}
/// @nodoc
class __$MangaDetailsModelCopyWithImpl<$Res>
    implements _$MangaDetailsModelCopyWith<$Res> {
  __$MangaDetailsModelCopyWithImpl(this._self, this._then);

  final _MangaDetailsModel _self;
  final $Res Function(_MangaDetailsModel) _then;

/// Create a copy of MangaDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? score = null,Object? repeat = null,Object? recommendedMangas = null,Object? characters = null,}) {
  return _then(_MangaDetailsModel(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,repeat: null == repeat ? _self.repeat : repeat // ignore: cast_nullable_to_non_nullable
as int,recommendedMangas: null == recommendedMangas ? _self._recommendedMangas : recommendedMangas // ignore: cast_nullable_to_non_nullable
as List<Manga>,characters: null == characters ? _self._characters : characters // ignore: cast_nullable_to_non_nullable
as List<MediaCharacter>,
  ));
}


}

// dart format on
