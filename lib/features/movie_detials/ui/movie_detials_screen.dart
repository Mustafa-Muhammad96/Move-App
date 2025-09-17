import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/genres_section.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/movie_details_app_bar.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/cast_section.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/movie_header.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/screenshots_section.dart';
import 'package:movie_app/features/similar_movies/view_model/similar_movies_view_model.dart';
import 'package:movie_app/features/similar_movies/views/similar_movies_section.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/summary_section.dart';

class MovieDetialsScreen extends StatelessWidget {
  final int moviesid;
  const MovieDetialsScreen({super.key, required this.moviesid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: const MovieDetailsAppBar(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieHeader(),
              ScreenshotsSection(),
              BlocProvider(
                create: (_) => SimilarMoviesViewModel()..getSimilarMovies(moviesid),
                child: SimilarMoviesSection(movieid: moviesid)),
              SummarySection(),
              CastSection(),
              GenresSection(),
            ],
          ),
        ),
      ),
    );
  }
}
