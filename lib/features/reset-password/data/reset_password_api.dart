import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordApi {
  Future<String> resetPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.patch(
      Uri.parse("https://route-movie-apis.vercel.app/auth/reset-password"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body)["message"];
    } else {
      throw Exception("Failed to reset password: ${response.body}");
    }
  }
}
