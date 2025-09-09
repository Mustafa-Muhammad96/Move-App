import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class DefaultElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  final String? svgAsset;
  final double svgSize;

  const DefaultElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.black,
    this.svgAsset,
    this.svgSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, 56),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppTheme.CustomeDarkTheme.textTheme.labelLarge?.copyWith(
              color: foregroundColor ?? const Color(0xff282A28),
            ),
          ),
          if (svgAsset != null) ...[
            SizedBox(width: 6),
            SvgPicture.asset(
              svgAsset!,
              width: svgSize,
              height: svgSize,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}
