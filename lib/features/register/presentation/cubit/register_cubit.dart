import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/register/data/repositories/register_repository_impl.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository repository;

  RegisterCubit(this.repository) : super(RegisterInitial());

  Future<void> register(
    String name,
    String email,
    String password,
    String phone,
    int avatarId,
  ) async {
    emit(RegisterLoading());
    try {
      final user = await repository.register(
        name,
        email,
        password,
        phone,
        avatarId,
      );
      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
