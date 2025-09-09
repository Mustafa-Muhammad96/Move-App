import 'movies_data.dart';

class MovieResponse{
  final String status;
  final String statusMessage;
  final MoviesData moviesData;

  MovieResponse({required this.status, required this.statusMessage, required this.moviesData});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
        status : json["status"],
        statusMessage : json["status_message"],
        moviesData: MoviesData.fromJson(json["data"])
    );
  }

}