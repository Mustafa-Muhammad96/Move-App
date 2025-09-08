import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarIcon extends StatelessWidget {
  String icon;
  String activeIcon;
  int index;
  int currentIndex;
  VoidCallback onTap;

  NavBarIcon({required this.icon, required this.activeIcon, required this.index ,required this.currentIndex , required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isSelected=currentIndex==index;

    return GestureDetector(
     onTap: onTap,
      child: SvgPicture.asset(isSelected? "assets/icons/$activeIcon.svg" :"assets/icons/$icon.svg", height: 24,width: 24,)
      );
  }
}