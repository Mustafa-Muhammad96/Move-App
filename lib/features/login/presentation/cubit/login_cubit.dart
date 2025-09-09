import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/login/data/models/login_request.dart';
import 'package:movie_app/features/login/data/repos/login_repo.dart';
import 'package:movie_app/features/login/presentation/cubit/login_states.dart';
import 'package:shared_preferences/shared_preferences.dart'; // اضف دي

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repository = LoginRepository();
  LoginCubit() : super(LoginInitial());

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    try {
      final response = await _repository.login(request);

      //  خزن التوكن اللي السيرفر رجعه
      if (response.token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", response.token!);
      }

      emit(LoginSuccess());
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        final statusCode = dioError.response?.statusCode;
        final message = dioError.response?.data["message"] ?? "Unknown error";
        emit(LoginError("$statusCode: $message"));
      } else {
        emit(LoginError(dioError.message ?? "Something went wrong"));
      }
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }
}
