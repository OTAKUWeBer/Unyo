class AuthTokenDto {
  final String accessToken;
  final String refreshToken;

  AuthTokenDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthTokenDto.fromJson(Map<String, dynamic> json) {
    return AuthTokenDto(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}