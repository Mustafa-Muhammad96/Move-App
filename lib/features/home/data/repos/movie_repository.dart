import 'package:movie_app/features/home/data/data_resources/remote_data_resource/movies_api_data_source.dart';
import 'package:movie_app/features/home/data/data_resources/remote_data_resource/movies_remote_data_sources.dart';
import 'package:movie_app/features/home/data/model/movie_response.dart';

class MovieRepository{
  final MovieRemoteDataSources _movieRemoteDataSources = MovieAPIDataSource();
  Future<MovieResponse> getAllMovies() async{
     return await _movieRemoteDataSources.getAllMovies();
  }
}