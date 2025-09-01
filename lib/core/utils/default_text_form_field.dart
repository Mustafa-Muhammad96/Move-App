import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  String hintText;
  TextEditingController? controller;
  void Function(String)? onChanged;
  String? prefixIconImageName;
  String? Function(String?)? validator;

  DefaultTextFormField({
    required this.hintText,
    this.controller,
    this.onChanged,
    this.prefixIconImageName,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: text.labelLarge!.copyWith(fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF282A28),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.hintText,
        ),
        prefixIcon: prefixIconImageName == null
            ? null
            : SvgPicture.asset(
                'assets/icons/$prefixIconImageName.svg',
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              ),
      ),
      validator: validator,
    );
  }
}
