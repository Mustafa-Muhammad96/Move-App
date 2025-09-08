import 'package:flutter/material.dart';

class GridViewItems extends StatelessWidget {
 String imageName;

 GridViewItems({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/${imageName}.png" , width: double.infinity, fit: BoxFit.fill,);
  }
}