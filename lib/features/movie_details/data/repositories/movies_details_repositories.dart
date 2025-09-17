import 'package:movie_app/features/home/data/model/movie.dart';
import 'package:movie_app/features/movie_details/data/data_sources/movies_remote_data_source.dart';

abstract class MoviesDetailsRepository {
  Future<Movie> getMovieDetails(int movieId);
}

class MoviesDetailsRepositoryImpl implements MoviesDetailsRepository {
  final MoviesRemoteDataSource remoteDataSource;

  MoviesDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Movie> getMovieDetails(int movieId) {
    return remoteDataSource.getMovieDetails(movieId);
  }
}
