class LoginResponse {
  final int? statusCode;
  final String message;

  LoginResponse({required this.statusCode, required this.message});

  factory LoginResponse.fromJson(Map<String , dynamic> json) {
      return LoginResponse(
          statusCode : json["statusCode"],
          message : json["message"]
      );
  }
}