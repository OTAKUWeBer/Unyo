/// Represents a user entity.
///
/// The [User] type defines the basic properties of a user, including:
/// - [id]: The unique identifier for the user.
/// - [name]: The user's display name.
/// - [email]: The user's email address.
abstract class User {
  final String name;
  final String avatarImage;
  final String accessToken;
  final String refreshToken;

  User(this.accessToken, this.refreshToken, {required this.name, required this.avatarImage});
}
