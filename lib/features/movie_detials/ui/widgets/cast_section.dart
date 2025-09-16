import 'package:flutter/material.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final List<Map<String, String>> cast = [
      {
        "image": "assets/images/cast1.png",
        "name": "Hayley Atwell",
        "character": "Captain Carter",
      },
      {
        "image": "assets/images/cast2.png",
        "name": "Elizabeth Olsen",
        "character": "Wanda Maximoff /\nThe Scarlet Witch",
      },
      {
        "image": "assets/images/cast3.png",
        "name": "Rachel McAdams",
        "character": "Dr. Christine Palmer",
      },
      {
        "image": "assets/images/cast4.png",
        "name": "Charlize Theron",
        "character": "Clea",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast",
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Column(
            children: cast.map((actor) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      actor["image"]!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : ${actor["name"]!}",
                          style: textTheme.labelLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Character : ${actor["character"]!}",
                          style: textTheme.labelLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
