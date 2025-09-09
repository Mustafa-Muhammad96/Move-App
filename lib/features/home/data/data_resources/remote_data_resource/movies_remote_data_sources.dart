import 'package:movie_app/features/home/data/model/movie_response.dart';

abstract class MovieRemoteDataSources{
  Future<MovieResponse> getAllMovies();
}