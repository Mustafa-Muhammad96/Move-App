import 'package:movie_app/features/login/data/data_resources/Remote/login_api_data_source.dart';
import 'package:movie_app/features/login/data/data_resources/Remote/remote_data_resources.dart';
import 'package:movie_app/features/login/data/models/login_request.dart';
import 'package:movie_app/features/login/data/models/login_response.dart';

class LoginRepository{
  final LoginRemoteDataResource _remoteDataResource = LoginAPIRemoteDataResource();

  Future<LoginResponse> login(LoginRequest request) async{
    final response = await _remoteDataResource.login(request);
    return response;
  }
}