import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ActionItems extends StatelessWidget {
  final String imageUrl;

  const ActionItems({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: MediaQuery.sizeOf(context).width * 0.3,
        height: MediaQuery.sizeOf(context).height * 0.25,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            Icon(Icons.broken_image, size: 50, color: Colors.grey),
      ),
      );
  }
}