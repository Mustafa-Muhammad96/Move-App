import 'package:movie_app/features/similar_movies/data/data_sources/similar_movies_api_data_sources.dart';
import 'package:movie_app/features/similar_movies/data/data_sources/similar_movies_data_sources.dart';
import 'package:movie_app/features/similar_movies/data/models/similar_movies_response/movie.dart';

class SimilarMoviesRepository {
  SimilarMoviesDataSources moviesDataSources=SimilarMoviesApiDataSources();

  Future<List<Movie>> getSimilarMovies(int movieId) {
 return  moviesDataSources.getSimilarMovies(movieId);
  }
}