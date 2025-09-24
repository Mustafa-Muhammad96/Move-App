import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color selectedForegroundcolor;
  final Color unSelectedForegroundcolor;
  final Color selectedBackgroundcolor;
  final Color unSelectedBackgroundcolor;

  const TabItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.selectedForegroundcolor,
    required this.unSelectedForegroundcolor,
    required this.selectedBackgroundcolor,
    required this.unSelectedBackgroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? selectedBackgroundcolor
              : unSelectedBackgroundcolor,
          border: isSelected
              ? null
              : Border.all(color: unSelectedForegroundcolor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: isSelected
                ? selectedForegroundcolor
                : unSelectedForegroundcolor,
          ),
        ),
      ),
    );
  }
}
