import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/utils/default_elevated_button.dart';
import 'package:movie_app/core/utils/default_text_form_field.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../providers/langauge_provider.dart';
import '../../utils/lang_toggle.dart';

//import 'package:movie_app/l10n/app_localizations.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = AppRoutes.registerScreen;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        centerTitle: true,
         title: Text(AppLocalizations.of(context)!.register),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.2,
                child: CarouselSlider(
                  items: [1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          'assets/images/avatar_$i.png',
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          width: MediaQuery.sizeOf(context).width * 0.4,
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.55,
                      viewportFraction: 0.37),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.avatar,
                style: textTheme.titleMedium,
              ),
              SizedBox(
                height: 8,
              ),
              DefaultTextFormField(
                hintText: AppLocalizations.of(context)!.name,
                iconName: 'name',
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Invalid name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DefaultTextFormField(
                hintText: AppLocalizations.of(context)!.email,
                iconName: 'email',
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return AppLocalizations.of(context)!.invalidEmail;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DefaultTextFormField(
                isPassword: true,
                hintText: AppLocalizations.of(context)!.password,
                iconName: 'password',
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return AppLocalizations.of(
                      context,
                    )!
                        .passwordMustBeAtLeast8Characters;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DefaultTextFormField(
                isPassword: true,
                hintText: AppLocalizations.of(context)!.confirmPassword,
                iconName: 'password',
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return AppLocalizations.of(
                      context,
                    )!
                        .passwordMustBeAtLeast8Characters;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DefaultTextFormField(
                hintText: AppLocalizations.of(context)!.phone,
                iconName: 'phone',
              ),
              SizedBox(height: 20),
              DefaultElevatedButton(
                label: AppLocalizations.of(context)!.createAccount,
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.homeScreen),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context)!.alreadyHaveAccount,
                    style: textTheme.titleSmall,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.loginScreen);
                    },
                    child: Text(AppLocalizations.of(context)!.login),
                  )
                ],
              ),
              LanguageSwitchRow(
                currentLang: languageProvider.locale.languageCode,
                onSelect: (lang) => languageProvider.changeLanguage(lang),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
