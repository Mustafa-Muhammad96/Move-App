import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/model/movie.dart';

class MoviesRemoteDataSource {
  final Dio dio;
  MoviesRemoteDataSource({required this.dio});

  Future<Movie> getMovieDetails(int movieId) async {
    try {
      debugPrint('Fetching movie with ID: $movieId');

      final response = await dio.get(
        'https://yts.mx/api/v2/movie_details.json',
        queryParameters: {'movie_id': movieId},
      );
      debugPrint('Response data: ${response.data}');

      final jsonMap = response.data;
      final movieJson = jsonMap['data']['movie'];

      debugPrint('description_full: ${movieJson['description_full']}');
      debugPrint('description_intro: ${movieJson['description_intro']}');

      return Movie.fromJson(jsonMap['data']['movie']);
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }
}
