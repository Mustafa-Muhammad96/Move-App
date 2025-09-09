import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12)
        ),
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.yellow),
        ),
      ),
    );
  }
}
