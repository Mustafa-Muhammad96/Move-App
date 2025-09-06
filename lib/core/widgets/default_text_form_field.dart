import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class DefaultTextFormField extends StatefulWidget {
  final String iconName;
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;

 const DefaultTextFormField({
    super.key,
    required this.iconName,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return TextFormField(
      obscureText: isObscure,
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      style: textTheme.titleMedium,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: textTheme.titleMedium,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            'assets/icons/${widget.iconName}.svg',
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.white,
                ),
              )
            : null,
      ),
    );
  }
}
