//External dependencies
import 'package:freezed_annotation/freezed_annotation.dart';

//Internal dependencies
import 'package:unyo/domain/entities/user.dart';

part 'anilist_user_model.freezed.dart';

part 'anilist_user_model.g.dart'; // For JSON serialization

@freezed
abstract class AnilistUserModel with _$AnilistUserModel implements User {
  const AnilistUserModel._();

  const factory AnilistUserModel({
    required String id,
    required String name,
    required String avatarImage,
    required String bannerImage,
    required String accessCode,
    required String accessToken,
    required String refreshToken,
  }) = _AnilistUserModel;

  factory AnilistUserModel.fromJson(Map<String, dynamic> json) =>
      _$AnilistUserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AnilistUserModelToJson(this as _AnilistUserModel);
}

class AnilistUserModelConverter
    implements JsonConverter<User, Map<String, dynamic>> {
  const AnilistUserModelConverter();

  @override
  User fromJson(Map<String, dynamic> json) => AnilistUserModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(User object) =>
      (object as AnilistUserModel).toJson();
}
