class LoginResponse {
  final int? statusCode;
  final String message;
  final String? token;

  LoginResponse({required this.statusCode, required this.message, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json["statusCode"],
      message: json["message"],
      token: json["data"], // هنا التوكن
    );
  }
}
