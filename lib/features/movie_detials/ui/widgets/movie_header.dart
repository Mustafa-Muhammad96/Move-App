import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/core/widgets/default_elevated_button.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/doctorstrange1.png",
              height: height * 0.692,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: height * 0.692,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color(0xff121312).withValues(alpha: 0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icons/watchMove.svg',
                width: width * 0.226,
                height: height * 0.104,
              ),
            ),
            Positioned(
              bottom: 15,
              child: Column(
                children: [
                  Text(
                    "Doctor Strange in the Multiverse\n of Madness",
                    textAlign: TextAlign.center,
                    style: text.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "2020",
                    style: text.labelLarge!.copyWith(
                      color: AppColors.gray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DefaultElevatedButton(
            label: "Watch",
            backgroundColor: AppColors.red,
            foregroundColor: AppColors.white,
            onPressed: () {},
          ),
        ),

        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoItem("assets/icons/love.svg", "125K", context),
              _buildInfoItem("assets/icons/clock.svg", "3.2K", context),
              _buildInfoItem("assets/icons/star.svg", "500", context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(String iconPath, String text, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.27,
      height: 47,

      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 28,
            height: 25,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
