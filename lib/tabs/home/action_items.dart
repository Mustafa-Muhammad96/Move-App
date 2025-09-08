import 'package:flutter/material.dart';

class ActionItems extends StatelessWidget {
  String imageName;

  ActionItems({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset("assets/images/${imageName}.jpg" ,height: double.infinity,fit: BoxFit.fill,
      )
      );
  }
}