import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class MovieDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onSave;
  final String backSvgPath;
  final String saveSvgPath;
  final double iconSize;

  const MovieDetailsAppBar({
    super.key,
    this.onBack,
    this.onSave,
    this.backSvgPath = 'assets/icons/arrowBack.svg',
    this.saveSvgPath = 'assets/icons/save.svg',
    this.iconSize = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,

      leading: IconButton(
        onPressed: onBack ?? () => Navigator.of(context).maybePop(),
        icon: SvgPicture.asset(
          backSvgPath,
          width: iconSize,
          height: iconSize,
          // لو عايز تغير لون الأيقونة استخدم ColorFilter
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          semanticsLabel: 'Back',
        ),
        splashRadius: 20,
        tooltip: 'Back',
      ),
      actions: [
        IconButton(
          onPressed: onSave ?? () {},
          icon: SvgPicture.asset(
            saveSvgPath,
            width: iconSize,
            height: iconSize,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
            semanticsLabel: 'Save',
          ),
          splashRadius: 20,
          tooltip: 'Save',
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
