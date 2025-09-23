import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_state.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/genres_section.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/movie_details_app_bar.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/cast_section.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/movie_header.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/screenshots_section.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/similar_movies_section.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/summary_section.dart';

import '../../similar_movies/view_model/similar_movies_view_model.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late int movieId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is int) {
      movieId = args;
      context.read<MovieDetailsCubit>().fetchMovieDetails(movieId);
    } else {
      debugPrint('No movie id passed to MovieDetailsScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is MovieDetailsLoaded) {
          final movie = state.movie;

          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: MovieDetailsAppBar(movie: movie), // 🟢 Movie كامل هنا
            body: SafeArea(
              top: false,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieHeader(movie: movie),
                    ScreenshotsSection(movie: movie),
                    BlocProvider(
                      create: (_) =>
                          SimilarMoviesViewModel()..getSimilarMovies(movieId),
                      child: SimilarMoviesSection(movieid: movieId),
                    ),
                    SummarySection(movie: movie),
                    CastSection(movie: movie),
                    GenresSection(movie: movie),
                  ],
                ),
              ),
            ),
          );
        } else if (state is MovieDetailsError) {
          return Scaffold(body: Center(child: Text(state.message)));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
