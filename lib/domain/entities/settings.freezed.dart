// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsModel {

@HiveField(0) String get language;@HiveField(1) Service get service;@HiveField(2) EpisodeService get episodeService;@HiveField(3)@ExtensionConverter() List<Extension> get installedAnimeExtensions;@HiveField(4)@ExtensionConverter() List<Extension> get installedMangaExtensions;@HiveField(5) String get aniyomiExtensionsRepositoryUrl;@HiveField(6) String get tachiyomiExtensionsRepositoryUrl;
/// Create a copy of SettingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsModelCopyWith<SettingsModel> get copyWith => _$SettingsModelCopyWithImpl<SettingsModel>(this as SettingsModel, _$identity);

  /// Serializes this SettingsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsModel&&(identical(other.language, language) || other.language == language)&&(identical(other.service, service) || other.service == service)&&(identical(other.episodeService, episodeService) || other.episodeService == episodeService)&&const DeepCollectionEquality().equals(other.installedAnimeExtensions, installedAnimeExtensions)&&const DeepCollectionEquality().equals(other.installedMangaExtensions, installedMangaExtensions)&&(identical(other.aniyomiExtensionsRepositoryUrl, aniyomiExtensionsRepositoryUrl) || other.aniyomiExtensionsRepositoryUrl == aniyomiExtensionsRepositoryUrl)&&(identical(other.tachiyomiExtensionsRepositoryUrl, tachiyomiExtensionsRepositoryUrl) || other.tachiyomiExtensionsRepositoryUrl == tachiyomiExtensionsRepositoryUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,service,episodeService,const DeepCollectionEquality().hash(installedAnimeExtensions),const DeepCollectionEquality().hash(installedMangaExtensions),aniyomiExtensionsRepositoryUrl,tachiyomiExtensionsRepositoryUrl);

@override
String toString() {
  return 'SettingsModel(language: $language, service: $service, episodeService: $episodeService, installedAnimeExtensions: $installedAnimeExtensions, installedMangaExtensions: $installedMangaExtensions, aniyomiExtensionsRepositoryUrl: $aniyomiExtensionsRepositoryUrl, tachiyomiExtensionsRepositoryUrl: $tachiyomiExtensionsRepositoryUrl)';
}


}

/// @nodoc
abstract mixin class $SettingsModelCopyWith<$Res>  {
  factory $SettingsModelCopyWith(SettingsModel value, $Res Function(SettingsModel) _then) = _$SettingsModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String language,@HiveField(1) Service service,@HiveField(2) EpisodeService episodeService,@HiveField(3)@ExtensionConverter() List<Extension> installedAnimeExtensions,@HiveField(4)@ExtensionConverter() List<Extension> installedMangaExtensions,@HiveField(5) String aniyomiExtensionsRepositoryUrl,@HiveField(6) String tachiyomiExtensionsRepositoryUrl
});




}
/// @nodoc
class _$SettingsModelCopyWithImpl<$Res>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._self, this._then);

  final SettingsModel _self;
  final $Res Function(SettingsModel) _then;

/// Create a copy of SettingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? language = null,Object? service = null,Object? episodeService = null,Object? installedAnimeExtensions = null,Object? installedMangaExtensions = null,Object? aniyomiExtensionsRepositoryUrl = null,Object? tachiyomiExtensionsRepositoryUrl = null,}) {
  return _then(_self.copyWith(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as Service,episodeService: null == episodeService ? _self.episodeService : episodeService // ignore: cast_nullable_to_non_nullable
as EpisodeService,installedAnimeExtensions: null == installedAnimeExtensions ? _self.installedAnimeExtensions : installedAnimeExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,installedMangaExtensions: null == installedMangaExtensions ? _self.installedMangaExtensions : installedMangaExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,aniyomiExtensionsRepositoryUrl: null == aniyomiExtensionsRepositoryUrl ? _self.aniyomiExtensionsRepositoryUrl : aniyomiExtensionsRepositoryUrl // ignore: cast_nullable_to_non_nullable
as String,tachiyomiExtensionsRepositoryUrl: null == tachiyomiExtensionsRepositoryUrl ? _self.tachiyomiExtensionsRepositoryUrl : tachiyomiExtensionsRepositoryUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsModel].
extension SettingsModelPatterns on SettingsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsModel value)  $default,){
final _that = this;
switch (_that) {
case _SettingsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsModel value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String language, @HiveField(1)  Service service, @HiveField(2)  EpisodeService episodeService, @HiveField(3)@ExtensionConverter()  List<Extension> installedAnimeExtensions, @HiveField(4)@ExtensionConverter()  List<Extension> installedMangaExtensions, @HiveField(5)  String aniyomiExtensionsRepositoryUrl, @HiveField(6)  String tachiyomiExtensionsRepositoryUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsModel() when $default != null:
return $default(_that.language,_that.service,_that.episodeService,_that.installedAnimeExtensions,_that.installedMangaExtensions,_that.aniyomiExtensionsRepositoryUrl,_that.tachiyomiExtensionsRepositoryUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String language, @HiveField(1)  Service service, @HiveField(2)  EpisodeService episodeService, @HiveField(3)@ExtensionConverter()  List<Extension> installedAnimeExtensions, @HiveField(4)@ExtensionConverter()  List<Extension> installedMangaExtensions, @HiveField(5)  String aniyomiExtensionsRepositoryUrl, @HiveField(6)  String tachiyomiExtensionsRepositoryUrl)  $default,) {final _that = this;
switch (_that) {
case _SettingsModel():
return $default(_that.language,_that.service,_that.episodeService,_that.installedAnimeExtensions,_that.installedMangaExtensions,_that.aniyomiExtensionsRepositoryUrl,_that.tachiyomiExtensionsRepositoryUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String language, @HiveField(1)  Service service, @HiveField(2)  EpisodeService episodeService, @HiveField(3)@ExtensionConverter()  List<Extension> installedAnimeExtensions, @HiveField(4)@ExtensionConverter()  List<Extension> installedMangaExtensions, @HiveField(5)  String aniyomiExtensionsRepositoryUrl, @HiveField(6)  String tachiyomiExtensionsRepositoryUrl)?  $default,) {final _that = this;
switch (_that) {
case _SettingsModel() when $default != null:
return $default(_that.language,_that.service,_that.episodeService,_that.installedAnimeExtensions,_that.installedMangaExtensions,_that.aniyomiExtensionsRepositoryUrl,_that.tachiyomiExtensionsRepositoryUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettingsModel implements SettingsModel {
  const _SettingsModel({@HiveField(0) this.language = 'en', @HiveField(1) this.service = Service.anilist, @HiveField(2) this.episodeService = EpisodeService.anizip, @HiveField(3)@ExtensionConverter() final  List<Extension> installedAnimeExtensions = const [], @HiveField(4)@ExtensionConverter() final  List<Extension> installedMangaExtensions = const [], @HiveField(5) this.aniyomiExtensionsRepositoryUrl = config.aniyomiExtensionsRepositoryUrl, @HiveField(6) this.tachiyomiExtensionsRepositoryUrl = config.tachiyomiExtensionsRepositoryUrl}): _installedAnimeExtensions = installedAnimeExtensions,_installedMangaExtensions = installedMangaExtensions;
  factory _SettingsModel.fromJson(Map<String, dynamic> json) => _$SettingsModelFromJson(json);

@override@JsonKey()@HiveField(0) final  String language;
@override@JsonKey()@HiveField(1) final  Service service;
@override@JsonKey()@HiveField(2) final  EpisodeService episodeService;
 final  List<Extension> _installedAnimeExtensions;
@override@JsonKey()@HiveField(3)@ExtensionConverter() List<Extension> get installedAnimeExtensions {
  if (_installedAnimeExtensions is EqualUnmodifiableListView) return _installedAnimeExtensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedAnimeExtensions);
}

 final  List<Extension> _installedMangaExtensions;
@override@JsonKey()@HiveField(4)@ExtensionConverter() List<Extension> get installedMangaExtensions {
  if (_installedMangaExtensions is EqualUnmodifiableListView) return _installedMangaExtensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedMangaExtensions);
}

@override@JsonKey()@HiveField(5) final  String aniyomiExtensionsRepositoryUrl;
@override@JsonKey()@HiveField(6) final  String tachiyomiExtensionsRepositoryUrl;

/// Create a copy of SettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsModelCopyWith<_SettingsModel> get copyWith => __$SettingsModelCopyWithImpl<_SettingsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsModel&&(identical(other.language, language) || other.language == language)&&(identical(other.service, service) || other.service == service)&&(identical(other.episodeService, episodeService) || other.episodeService == episodeService)&&const DeepCollectionEquality().equals(other._installedAnimeExtensions, _installedAnimeExtensions)&&const DeepCollectionEquality().equals(other._installedMangaExtensions, _installedMangaExtensions)&&(identical(other.aniyomiExtensionsRepositoryUrl, aniyomiExtensionsRepositoryUrl) || other.aniyomiExtensionsRepositoryUrl == aniyomiExtensionsRepositoryUrl)&&(identical(other.tachiyomiExtensionsRepositoryUrl, tachiyomiExtensionsRepositoryUrl) || other.tachiyomiExtensionsRepositoryUrl == tachiyomiExtensionsRepositoryUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,service,episodeService,const DeepCollectionEquality().hash(_installedAnimeExtensions),const DeepCollectionEquality().hash(_installedMangaExtensions),aniyomiExtensionsRepositoryUrl,tachiyomiExtensionsRepositoryUrl);

@override
String toString() {
  return 'SettingsModel(language: $language, service: $service, episodeService: $episodeService, installedAnimeExtensions: $installedAnimeExtensions, installedMangaExtensions: $installedMangaExtensions, aniyomiExtensionsRepositoryUrl: $aniyomiExtensionsRepositoryUrl, tachiyomiExtensionsRepositoryUrl: $tachiyomiExtensionsRepositoryUrl)';
}


}

/// @nodoc
abstract mixin class _$SettingsModelCopyWith<$Res> implements $SettingsModelCopyWith<$Res> {
  factory _$SettingsModelCopyWith(_SettingsModel value, $Res Function(_SettingsModel) _then) = __$SettingsModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String language,@HiveField(1) Service service,@HiveField(2) EpisodeService episodeService,@HiveField(3)@ExtensionConverter() List<Extension> installedAnimeExtensions,@HiveField(4)@ExtensionConverter() List<Extension> installedMangaExtensions,@HiveField(5) String aniyomiExtensionsRepositoryUrl,@HiveField(6) String tachiyomiExtensionsRepositoryUrl
});




}
/// @nodoc
class __$SettingsModelCopyWithImpl<$Res>
    implements _$SettingsModelCopyWith<$Res> {
  __$SettingsModelCopyWithImpl(this._self, this._then);

  final _SettingsModel _self;
  final $Res Function(_SettingsModel) _then;

/// Create a copy of SettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = null,Object? service = null,Object? episodeService = null,Object? installedAnimeExtensions = null,Object? installedMangaExtensions = null,Object? aniyomiExtensionsRepositoryUrl = null,Object? tachiyomiExtensionsRepositoryUrl = null,}) {
  return _then(_SettingsModel(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as Service,episodeService: null == episodeService ? _self.episodeService : episodeService // ignore: cast_nullable_to_non_nullable
as EpisodeService,installedAnimeExtensions: null == installedAnimeExtensions ? _self._installedAnimeExtensions : installedAnimeExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,installedMangaExtensions: null == installedMangaExtensions ? _self._installedMangaExtensions : installedMangaExtensions // ignore: cast_nullable_to_non_nullable
as List<Extension>,aniyomiExtensionsRepositoryUrl: null == aniyomiExtensionsRepositoryUrl ? _self.aniyomiExtensionsRepositoryUrl : aniyomiExtensionsRepositoryUrl // ignore: cast_nullable_to_non_nullable
as String,tachiyomiExtensionsRepositoryUrl: null == tachiyomiExtensionsRepositoryUrl ? _self.tachiyomiExtensionsRepositoryUrl : tachiyomiExtensionsRepositoryUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
