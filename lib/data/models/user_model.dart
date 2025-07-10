//External dependencies
import 'package:freezed_annotation/freezed_annotation.dart';

//Internal dependencies
import 'package:unyo/domain/entities/user.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart'; // For JSON serialization

@freezed
abstract class UserModel with _$UserModel implements User {
  const UserModel._();

  const factory UserModel({required String name, required String avatarImage}) = _UserModel;

  factory UserModel.empty() => const UserModel(name: '', avatarImage: 'https://i.imgur.com/EKtChtm.png');

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this as _UserModel);
}

class UserConverter implements JsonConverter<User, Map<String, dynamic>> {
  const UserConverter();

  @override
  User fromJson(Map<String, dynamic> json) => UserModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(User object) => (object as UserModel).toJson();
}