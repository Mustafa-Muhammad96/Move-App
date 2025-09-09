import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/repos/movie_repository.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_states.dart';

class MovieCubit extends Cubit<MovieStates>{
  final MovieRepository _repository = MovieRepository();
  MovieCubit():super(MovieInitial());
  Future<void> getAllMovies() async{
    emit(MoviesLoading());
    try{
      final response = await _repository.getAllMovies();
      emit(MoviesSuccess(response));
    }on DioException catch (dioError) {
      if (dioError.response != null) {
        final statusCode = dioError.response?.statusCode;
        final message = dioError.response?.data["message"] ?? "Unknown error";
        emit(MoviesError("$statusCode: $message"));
      } else {
        emit(MoviesError(dioError.message ?? "Something went wrong"));
      }
    } catch (error) {
      emit(MoviesError(error.toString()));
    }
  }
}