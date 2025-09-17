import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/model/movie.dart';

class GenresSection extends StatelessWidget {
  final Movie movie;
  const GenresSection({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final List<String> genres = movie.genres ?? [];

    List<List<String>> chunkedGenres = [];
    for (int i = 0; i < genres.length; i += 3) {
      chunkedGenres.add(
        genres.sublist(i, i + 3 > genres.length ? genres.length : i + 3),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Genres",
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),

          Column(
            children: chunkedGenres.map((rowGenres) {
              while (rowGenres.length < 3) {
                rowGenres.add("");
              }

              return Row(
                children: rowGenres.map((genre) {
                  return Expanded(
                    child: genre.isEmpty
                        ? const SizedBox()
                        : Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  genre,
                                  style: textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ),
                          ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
