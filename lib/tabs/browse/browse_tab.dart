import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/model/movie.dart';
import 'package:movie_app/tabs/browse/browse_tab_bar.dart';
import 'package:movie_app/core/utils/movie_helper.dart';
import 'package:movie_app/tabs/browse/grid_view_items.dart';

class BrowseTab extends StatelessWidget {
  final List<Movie> movies;

  const BrowseTab({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final genres = getAllGenres(movies).toList();

    return DefaultTabController(
      length: genres.length,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              BrowseTabBar(genres: genres),
              Expanded(
                child: TabBarView(
                  children: [
                    for (final genre in genres)
                      GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 8,
                              childAspectRatio: 0.8,
                            ),
                        itemCount: getMoviesByGenre(movies, genre).length,
                        itemBuilder: (context, index) {
                          final movie = getMoviesByGenre(movies, genre)[index];
                          return GridViewItems(movie: movie);
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
