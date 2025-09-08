import 'package:dio/dio.dart';
import 'package:movie_app/core/widgets/constants.dart';
import 'package:movie_app/features/login/data/data_resources/Remote/remote_data_resources.dart';
import 'package:movie_app/features/login/data/models/login_request.dart';
import 'package:movie_app/features/login/data/models/login_response.dart';

class LoginAPIRemoteDataResource implements LoginRemoteDataResource{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: APIConstants.baseURI
    )
  );

  @override
  Future<LoginResponse> login(LoginRequest request) async {
      final response = await _dio.post(
          APIConstants.loginURI,
          data: request.toJson());
      return LoginResponse.fromJson(response.data);
  }
}