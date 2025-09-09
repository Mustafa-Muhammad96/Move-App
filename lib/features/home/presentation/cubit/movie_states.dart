import 'package:movie_app/features/home/data/model/movie_response.dart';

abstract class MovieStates{}

class MovieInitial extends MovieStates{}

class MoviesLoading extends MovieStates{}

class MoviesSuccess extends MovieStates{
  final MovieResponse moviesResponse;
  MoviesSuccess(this.moviesResponse);
}

class MoviesError extends MovieStates {
  final String message;
  MoviesError(this.message);
}