import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/features/home/data/model/movie.dart';

class GridViewItems extends StatelessWidget {
  final Movie movie;

  const GridViewItems({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.movieDetailsScreen,
          arguments: movie.id,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.network(
                movie.mediumCoverImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 220,
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
                        movie.rating.toString(),
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall!.copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.star, color: AppColors.yellow, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
