import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/default_elevated_button.dart';
import 'package:movie_app/features/home/data/model/movie.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieHeader extends StatelessWidget {
  final Movie movie;
  const MovieHeader({super.key, required this.movie});

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
            CachedNetworkImage(
              imageUrl: movie.largeCoverImage ?? '',
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
                    movie.title ?? 'Movie',
                    textAlign: TextAlign.center,
                    style: text.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    movie.year.toString(),
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
            onPressed: () async {
              final Uri url = Uri.parse(movie.url!);
              try{
                await launchUrl(url, mode: LaunchMode.platformDefault);
              }catch(e){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Could not launch $url")),
                );
              }
            },
          ),
        ),

        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoItem(
                "assets/icons/love.svg",
                movie.likeCount.toString(),
                context,
              ),
              _buildInfoItem(
                "assets/icons/clock.svg",
                movie.runtime.toString(),
                context,
              ),
              _buildInfoItem(
                "assets/icons/star.svg",
                movie.rating.toString(),
                context,
              ),
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
