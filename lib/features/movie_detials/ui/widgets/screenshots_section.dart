import 'package:flutter/material.dart';

class ScreenshotsSection extends StatelessWidget {
  const ScreenshotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> screenshots = [
      "assets/images/shot1.png",
      "assets/images/shot2.png",
      "assets/images/shot3.png",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 13),
          Text(
            "Screen Shots",
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Column(
            children: screenshots.map((path) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(path, fit: BoxFit.cover),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
