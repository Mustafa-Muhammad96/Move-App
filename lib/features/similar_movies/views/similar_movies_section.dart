import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/loading_indicator.dart';
import 'package:movie_app/features/similar_movies/data/models/similar_movies_response/movie.dart';
import 'package:movie_app/features/similar_movies/data/repositories/similar_movies_repository.dart';
import 'package:movie_app/features/similar_movies/view_model/similar_movies_states.dart';
import 'package:movie_app/features/similar_movies/view_model/similar_movies_view_model.dart';

class SimilarMoviesSection extends StatelessWidget {
  final int movieid;
  const SimilarMoviesSection({super.key, required this.movieid});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SizedBox(height: 10),
          Text(
            "Similar Movies",
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
       
         BlocBuilder<SimilarMoviesViewModel,SimilarMoviesStates>(
          builder: (context, state)  {
            if(state is GetsimilarMoviesLoading){
              return LoadingIndicator();
            }else if(state is GetsimilarMoviesError){
              return Text("something Went wrong",style:Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.primary),);
            }else if(state is GetsimilarMoviesSuccess){
             List<Movie> movies=state.movies;
             if(movies.isEmpty){
              return Text("no similar movies found",style:Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.primary),);
             }
             return Wrap(
            spacing: 12,
            runSpacing: 12,
            children: movies.map((movie) {
              final imageURL=movie.mediumCoverImage?? "";
              final rating=movie.rating?.toString() ?? "";
              return SizedBox(
                width:
                    (MediaQuery.of(context).size.width - 16 * 2 - 12) /
                    2, // نص العرض مع spacing
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      // صورة الفيلم
                     imageURL.isNotEmpty? Image.network(
                      imageURL,
                       fit: BoxFit.cover,
                        width: double.infinity,
                        height: 220,
                      ):
                      Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg"
                      ),

                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                rating,
                                style: Theme.of(context).textTheme.labelSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.star,
                                color: AppColors.yellow,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );

            }else{
              return SizedBox();
            }
          }
        ),
        ],
      ),
    );
  }
}
