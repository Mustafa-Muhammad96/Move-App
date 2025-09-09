import '../../features/home/data/model/movie.dart';

List<Movie> getMoviesByGenre(List<Movie> allMovies, String genre) {
  return allMovies.where((movie) => movie.genres!.contains(genre)).toList();
}

Set getAllGenres(List<Movie> movies) {
  return movies.expand((movie) => movie.genres!).toSet();
}
