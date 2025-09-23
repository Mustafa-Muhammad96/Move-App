import '../data_sources/register_remote_data_source.dart';
import '../models/register_model.dart';

class RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepository(this.remoteDataSource);

  Future<RegisterModel> register(
    String name,
    String email,
    String password,
    String phone,
    int avatarId,
  ) {
    return remoteDataSource.registerUser(
      name: name,
      email: email,
      password: password,
      phone: phone,
      avatarId: avatarId,
    );
  }
}
