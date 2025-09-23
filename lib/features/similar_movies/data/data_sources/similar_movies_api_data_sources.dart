import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/features/similar_movies/data/data_sources/similar_movies_data_sources.dart';
import 'package:movie_app/features/similar_movies/data/models/similar_movies_response/movie.dart';
import 'package:movie_app/features/similar_movies/data/models/similar_movies_response/similar_movies_response.dart';

class SimilarMoviesApiDataSources implements SimilarMoviesDataSources{

  @override
  Future<List<Movie>> getSimilarMovies( int movieId)async{
    Uri uri=Uri.https(
      'yts.mx' ,
      '/api/v2/movie_suggestions.json',
      {'movie_id' :movieId.toString()}
      );

    http.Response response =await http.get(uri);

   Map<String,dynamic> json =jsonDecode(response.body);

   SimilarMoviesResponse moviesResponse=SimilarMoviesResponse.fromJson(json);
   if(moviesResponse.status=="ok" &&moviesResponse.data!=null &&moviesResponse.data!.movies !=null){
    return moviesResponse.data!.movies!;
   }else{
    throw Exception("Not Found Similar Movies");
   }
  }
}