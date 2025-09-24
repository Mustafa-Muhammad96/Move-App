import '../../features/home/data/model/movie.dart';

List<Movie> getMoviesByGenre(List<Movie> allMovies, String genre) {
  return allMovies
      .where((movie) => movie.genres != null && movie.genres!.contains(genre))
      .toList();
}

Set<String> getAllGenres(List<Movie> movies) {
  return movies
      .where((movie) => movie.genres != null)
      .expand((movie) => movie.genres!)
      .toSet();
}
