import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/data_resources/remote_data_resource/movies_remote_data_sources.dart';
import 'package:movie_app/features/home/data/model/movie_response.dart';

class MovieAPIDataSource extends MovieRemoteDataSources{
  final Dio _dio = Dio();
  @override
  Future<MovieResponse> getAllMovies() async{
    final response = await _dio.get('https://yts.mx/api/v2/list_movies.json');
    final jsonResponse = response.data as Map<String, dynamic>;
    return MovieResponse.fromJson(jsonResponse);
  }

}