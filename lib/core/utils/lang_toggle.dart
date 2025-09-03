import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class LanguageSwitchRow extends StatelessWidget {
  final String currentLang;
  final Function(String) onSelect;

  const LanguageSwitchRow({
    super.key,
    required this.currentLang,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 120,
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.yellow, width: 3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => onSelect("en"),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: currentLang == "en" ? Colors.yellow : Colors.transparent,
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage("assets/images/LR.png"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onSelect("ar"),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: currentLang == "ar" ? Colors.yellow : Colors.transparent,
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage("assets/images/EG.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
