import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/tabs/browse/tab_item.dart';

class BrowseTabBar extends StatelessWidget {
  final List<String> genres;

  const BrowseTabBar({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    final tabController = DefaultTabController.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: AnimatedBuilder(
        animation: tabController,
        builder: (context, _) {
          return TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.only(right: 8),
            tabs: [
              for (int i = 0; i < genres.length; i++)
                TabItem(
                  label: genres[i],
                  isSelected: tabController.index == i,
                  selectedForegroundcolor: const Color(0xFF000000),
                  unSelectedForegroundcolor: AppColors.primary,
                  selectedBackgroundcolor: AppColors.primary,
                  unSelectedBackgroundcolor: Colors.transparent,
                ),
            ],
          );
        },
      ),
    );
  }
}
