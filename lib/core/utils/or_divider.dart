import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class OrDivider extends StatelessWidget {
  final String text;
  final Color lineColor;
  final Color textColor;

  const OrDivider({
    super.key,
    this.text = "OR",
    this.lineColor = AppColors.yellow,
    this.textColor = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: lineColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: lineColor,
          ),
        ),
      ],
    );
  }
}
