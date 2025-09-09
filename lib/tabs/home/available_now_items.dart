import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvailableNowItems extends StatelessWidget {
  final String imageUrl;

  const AvailableNowItems({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        width: double.infinity,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            Icon(Icons.broken_image, size: 50, color: Colors.grey),
      ),
    );
  }
}