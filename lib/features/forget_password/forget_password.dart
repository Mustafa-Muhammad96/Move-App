import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/default_elevated_button.dart';
import 'package:movie_app/core/widgets/default_text_form_field.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    TextTheme text = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: Text(
          "Forget Password",
          style: text.titleMedium!.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.normal,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/forgotpasswordbro1.png',
              width: double.infinity,
              height: height * 0.454,
              fit: BoxFit.contain,
            ),
            DefaultTextFormField(
              hintText: loc.email,
              controller: emailController,
              iconName: 'email',
            ),
            SizedBox(height: height * 0.02724),
            DefaultElevatedButton(
              label: loc.verifyEmail,
              backgroundColor: AppColors.primary,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
