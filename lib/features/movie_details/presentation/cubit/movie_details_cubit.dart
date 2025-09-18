import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_details/data/repositories/movies_details_repositories.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MoviesDetailsRepository repository;

  MovieDetailsCubit(this.repository) : super(MovieDetailsInitial());

  void fetchMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());
    try {
      final movie = await repository.getMovieDetails(movieId);
      emit(MovieDetailsLoaded(movie));
    } catch (e) {
      emit(MovieDetailsError('Failed to fetch movie details'));
    }
  }
}
