import 'package:movie_app/features/home/data/model/movie.dart';

class MoviesData{
 final int movieCount;
 final int limit;
 final int pageNumber;
 final List<Movie> movies;

  MoviesData({required this.movieCount, required this.limit, required this.pageNumber, required this.movies});
 factory MoviesData.fromJson(Map<String, dynamic> json){
  return MoviesData(
      movieCount: json["movie_count"],
      limit: json["limit"],
      pageNumber: json["page_number"],
      movies: (json["movies"] as List)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList());
 }
}