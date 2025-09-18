import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/model/movie.dart';

class SummarySection extends StatelessWidget {
  final Movie movie;
  const SummarySection({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    debugPrint('summery : ${movie.descriptionFull}');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Summary",
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            movie.summary?.isNotEmpty == true
                ? movie.descriptionFull!
                : 'Summary is not available',
            style: textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              height: 1.5, // line height
            ),
          ),
        ],
      ),
    );
  }
}
