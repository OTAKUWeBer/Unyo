import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

abstract class User {
  final String id;
  final String name;
  final String avatarImage;
  final String bannerImage;

  User(this.id, {required this.name, required this.avatarImage, required this.bannerImage});
}

@freezed
abstract class UserModel with _$UserModel implements User {
  const factory UserModel({
    required String id,
    required String name,
    required String avatarImage,
    required String bannerImage,
  }) = _UserModel;

  factory UserModel.empty() => const UserModel(
    id: '',
    name: '',
    avatarImage: 'https://i.imgur.com/EKtChtm.png',
    bannerImage: '',
  );
}