import 'package:flutter/material.dart';

class AvailableNowItems extends StatelessWidget {
  String imageName;

  AvailableNowItems({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset("assets/images/${imageName}.jpg" ,fit: BoxFit.fill,width: double.infinity,));
  }
}