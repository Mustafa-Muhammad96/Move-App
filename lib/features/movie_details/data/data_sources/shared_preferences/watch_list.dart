import 'package:shared_preferences/shared_preferences.dart';

class WatchlistService {
  static const _key = 'watchlist_movies';

  static Future<void> addMovie(String movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final movies = prefs.getStringList(_key) ?? [];
    if (!movies.contains(movieId)) {
      movies.add(movieId);
      await prefs.setStringList(_key, movies);
    }
  }

  static Future<void> removeMovie(String movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final movies = prefs.getStringList(_key) ?? [];
    movies.remove(movieId);
    await prefs.setStringList(_key, movies);
  }

  static Future<List<String>> getMovies() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<bool> isMovieSaved(String movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final movies = prefs.getStringList(_key) ?? [];
    return movies.contains(movieId);
  }
}
