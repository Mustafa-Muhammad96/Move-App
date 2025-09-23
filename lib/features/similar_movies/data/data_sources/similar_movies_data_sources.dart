import 'package:movie_app/features/similar_movies/data/models/similar_movies_response/movie.dart';

abstract class SimilarMoviesDataSources {
  Future<List<Movie>> getSimilarMovies( int movieId);
}