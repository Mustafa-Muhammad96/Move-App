import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> resetPassword(String oldPassword, String newPassword) async {
    emit(ResetPasswordLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token") ?? "";

      final response = await http.patch(
        Uri.parse("https://route-movie-apis.vercel.app/auth/reset-password"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        emit(
          ResetPasswordSuccess(
            data["message"] ?? "Password updated successfully",
          ),
        );
      } else {
        // لو السيرفر رجع error message
        try {
          final data = jsonDecode(response.body);
          emit(ResetPasswordError(data["message"] ?? "Something went wrong"));
        } catch (_) {
          emit(ResetPasswordError("Unexpected error: ${response.body}"));
        }
      }
    } catch (e) {
      emit(ResetPasswordError("Exception: ${e.toString()}"));
    }
  }
}
