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
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onSelect("en"),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: currentLang == "en" ? AppColors.yellow : AppColors.backgroundDark,
                    width: 3,
                  ),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/LR.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => onSelect("ar"),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: currentLang == "ar" ? AppColors.yellow : AppColors.backgroundDark,
                    width: 3,
                  ),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/EG.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
