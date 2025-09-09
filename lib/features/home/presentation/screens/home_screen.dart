import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/nav_bar_icon.dart';
import 'package:movie_app/tabs/browse/browse_tab.dart';
import 'package:movie_app/tabs/home/home_tab.dart';
import 'package:movie_app/tabs/profile/profile_tab.dart';
import 'package:movie_app/tabs/search/search_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';
  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), ProfileTab()];

  void onClicked(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: tabs[currentIndex],

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 19),
        margin: EdgeInsets.only(left: 9, right: 9, bottom: 9),
        decoration: BoxDecoration(
          color: AppColors.darkGray,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarIcon(
              icon: "home",
              activeIcon: "select_home",
              index: 0,
              currentIndex: currentIndex,
              onTap: () => onClicked(0),
            ),
            NavBarIcon(
              icon: "search",
              activeIcon: "select_search",
              index: 1,
              currentIndex: currentIndex,
              onTap: () => onClicked(1),
            ),
            NavBarIcon(
              icon: "explore",
              activeIcon: "select_explore",
              index: 2,
              currentIndex: currentIndex,
              onTap: () => onClicked(2),
            ),
            NavBarIcon(
              icon: "profile",
              activeIcon: "select_profile",
              index: 3,
              currentIndex: currentIndex,
              onTap: () => onClicked(3),
            ),
          ],
        ),
      ),
    );
  }
}
