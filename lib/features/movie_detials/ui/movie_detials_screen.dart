import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/genres_section.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/movie_details_app_bar.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/cast_section.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/movie_header.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/screenshots_section.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/similar_movies_section.dart';
import 'package:movie_app/features/movie_detials/ui/widgets/summary_section.dart';

class MovieDetialsScreen extends StatelessWidget {
  const MovieDetialsScreen({super.key});

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
              SimilarMoviesSection(),
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
