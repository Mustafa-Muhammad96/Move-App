import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
 String label;
 bool isSelected;
 Color selectedForegroundcolor;
 Color unSelectedForegroundcolor;
 Color selectedBackgroundcolor;


 TabItem({
  required this.label,
  required this.isSelected,
  required this.selectedForegroundcolor,
  required this.unSelectedForegroundcolor,
  required this.selectedBackgroundcolor,
 });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical: 6, horizontal: 14) ,
      decoration: BoxDecoration(
        color: isSelected? selectedBackgroundcolor :Colors.transparent,
        border: isSelected? null : Border.all(color: unSelectedForegroundcolor),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Text(label , style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w700 ,color: isSelected? selectedForegroundcolor : unSelectedForegroundcolor),),
    ) ;
  }
}