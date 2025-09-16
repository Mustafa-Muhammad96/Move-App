import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class SimilarMoviesSection extends StatelessWidget {
  const SimilarMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> movies = [
      {"image": "assets/images/similar1.png", "rating": "8.5"},
      {"image": "assets/images/similar2.png", "rating": "7.9"},
      {"image": "assets/images/similar3.png", "rating": "9.1"},
      {"image": "assets/images/similar4.png", "rating": "8.0"},
    ];

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

          // ===== الشبكة =====
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: movies.map((movie) {
              return SizedBox(
                width:
                    (MediaQuery.of(context).size.width - 16 * 2 - 12) /
                    2, // نص العرض مع spacing
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      // صورة الفيلم
                      Image.asset(
                        movie["image"],
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
                                movie["rating"],
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
          ),
        ],
      ),
    );
  }
}
