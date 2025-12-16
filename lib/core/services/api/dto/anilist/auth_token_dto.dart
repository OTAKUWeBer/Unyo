class AuthTokenEntity {
  final String accessToken;
  final String refreshToken;

  AuthTokenEntity({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthTokenEntity.fromJson(Map<String, dynamic> json) {
    return AuthTokenEntity(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}