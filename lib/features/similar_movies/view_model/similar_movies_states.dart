import 'package:movie_app/features/similar_movies/data/models/similar_movies_response/movie.dart';

abstract class SimilarMoviesStates {}

class similarMoviesInitial extends SimilarMoviesStates{}

class GetsimilarMoviesLoading extends SimilarMoviesStates{}

class GetsimilarMoviesError extends SimilarMoviesStates{
  String error;
  GetsimilarMoviesError(this.error);
}

class GetsimilarMoviesSuccess extends SimilarMoviesStates{
  List<Movie> movies;
  GetsimilarMoviesSuccess(this.movies);
}