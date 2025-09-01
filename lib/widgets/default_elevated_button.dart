import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class DefaultElevatedButton extends StatelessWidget {
   String label;
   VoidCallback onPressed;

   DefaultElevatedButton({required this.label ,required this.onPressed});
  

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,

       child:Text(label , style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.black),) ,

       style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width , 55),
       ),
       );
  }
}

