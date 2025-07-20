//External dependencies
import 'package:freezed_annotation/freezed_annotation.dart';

//Internal dependencies
import 'package:unyo/domain/entities/user.dart';

part 'local_user_model.freezed.dart';

part 'local_user_model.g.dart'; // For JSON serialization

@freezed
abstract class LocalUserModel with _$LocalUserModel implements User {
  const LocalUserModel._();

  const factory LocalUserModel({
    required String id,
    required String name,
    required String avatarImage,
    required String bannerImage,
  }) = _LocalUserModel;

  factory LocalUserModel.fromJson(Map<String, dynamic> json) =>
      _$LocalUserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LocalUserModelToJson(this as _LocalUserModel);
}

class LocalUserModelConverter implements JsonConverter<User, Map<String, dynamic>> {
  const LocalUserModelConverter();

  @override
  User fromJson(Map<String, dynamic> json) => LocalUserModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(User object) =>
      (object as LocalUserModel).toJson();
}
