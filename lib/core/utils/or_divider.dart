import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class OrDivider extends StatelessWidget {
  final String text;
  final Color lineColor;
  final Color textColor;
  final double lineWidth;

  const OrDivider({
    super.key,
    this.text = "OR",
    this.lineColor = AppColors.yellow,
    this.textColor = Colors.yellow,
    this.lineWidth = 90,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: lineWidth,
          child: Divider(
            thickness: 1,
            color: lineColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
        SizedBox(
          width: lineWidth,
          child: Divider(
            thickness: 1,
            color: lineColor,
          ),
        ),
      ],
    );
  }
}

