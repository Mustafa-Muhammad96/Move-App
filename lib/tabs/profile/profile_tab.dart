import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/default_elevated_button.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/avatar/avatar1.png',
                          height: screenSize.height * 0.15,
                          width: screenSize.width * 0.33,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'User Name',
                          style: textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '12',
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Wish List',
                          style: textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '10',
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'History',
                          style: textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DefaultElevatedButton(
                        label: AppLocalizations.of(context)!.editProfile,
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.updateProfileScreen);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: DefaultElevatedButton(
                        label: AppLocalizations.of(context)!.exit,
                        backgroundColor: AppColors.red,
                        foregroundColor: AppColors.white,
                        svgAsset: 'assets/icons/exit.svg',
                        svgSize: 16,
                        onPressed: () {
                          // TODO logout logic
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor: AppColors.primary,
                  labelColor: AppColors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: AppColors.white,
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
                  tabs: [
                    Tab(
                      text: "Watch List",
                      icon: SizedBox(
                        width: 35,
                        height: 35,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: SvgPicture.asset(
                            'assets/icons/watch_list.svg',
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      text: "History",
                      icon: SizedBox(
                        width: 35,
                        height: 35,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: SvgPicture.asset('assets/icons/history.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/search_empty.png",
                          height: screenSize.height * 0.3,
                          width: screenSize.width * 0.3,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/search_empty.png",
                          height: screenSize.height * 0.3,
                          width: screenSize.width * 0.3,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
