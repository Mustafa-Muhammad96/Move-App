import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';

class GridViewItems extends StatelessWidget {
  final String imageName;

  GridViewItems({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.movieDetialsScreen);
      },
      child: Image.asset(
        "assets/images/${imageName}.png",
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
