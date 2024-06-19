class Auth {
  String access_token;
  int expires;
  String refresh_token;

  Auth({
    required this.access_token,
    required this.expires,
    required this.refresh_token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      access_token: json['access_token'] as String,
      expires: json['expires'] as int,
      refresh_token: json['refresh_token'] as String,
    );
  }
}
