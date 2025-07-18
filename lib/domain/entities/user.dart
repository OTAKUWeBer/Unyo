/// Represents a user entity.
///
/// The [User] type defines the basic properties of a user, including:
/// - [id]: The unique identifier for the user.
/// - [name]: The user's display name.
/// - [email]: The user's email address.
abstract class User {
  final String name;
  final String avatarImage;
  final String accessCode;
  final String accessToken;
  final String refreshToken;

  User({required this.name, required this.avatarImage, required this.accessCode, required this.accessToken, required this.refreshToken});
}
