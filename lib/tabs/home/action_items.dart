import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';

class ActionItems extends StatelessWidget {
  final String imageUrl;
  final int movieId;

  const ActionItems({super.key, required this.imageUrl, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.movieDetailsScreen,
          arguments: movieId,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: MediaQuery.sizeOf(context).width * 0.3,
          height: MediaQuery.sizeOf(context).height * 0.25,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Icon(Icons.broken_image, size: 50, color: Colors.grey),
        ),
      ),
    );
  }
}
