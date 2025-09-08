import 'package:movie_app/features/login/data/models/login_request.dart';
import 'package:movie_app/features/login/data/models/login_response.dart';

abstract class LoginRemoteDataResource{
  Future<LoginResponse> login(LoginRequest request);
}