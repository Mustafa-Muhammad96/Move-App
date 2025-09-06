import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/or_divider.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:movie_app/core/widgets/default_text_form_field.dart';
import 'package:movie_app/core/widgets/default_elevated_button.dart';
import 'package:provider/provider.dart';
import '../../../providers/language_provider.dart';
import '../../core/routes/routes.dart';
import '../../core/widgets//lang_toggle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
               children: [
                 SizedBox(height: 40,),
                 Image.asset('assets/images/login_1.png'),
                 SizedBox(height: 50),
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
                 SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     GestureDetector(
                       onTap: (){
                         Navigator.of(context).pushNamed(AppRoutes.forgetPassword);
                       },
                       child: Text(
                         AppLocalizations.of(context)!.forgetPassword,
                         style: TextStyle(
                           color: AppColors.yellow,
                           fontSize: 14,
                           fontWeight: FontWeight.w400
                         ),
                       ),
                     )
                   ],
                 ),
                 SizedBox(height: 30,),
                 DefaultElevatedButton(
                   label: AppLocalizations.of(context)!.login,
                   onPressed: () =>
                       Navigator.pushNamed(context, AppRoutes.homeScreen),
                 ),
                 SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(AppLocalizations.of(context)!.notHaveAccount,
                     style: TextStyle(
                         color: AppColors.white,
                         fontSize: 14,
                         fontWeight: FontWeight.w400
                     ),
                     ),
                     SizedBox(width: 6,),
                     GestureDetector(
                       onTap: (){
                         Navigator.of(context).pushNamed(AppRoutes.registerScreen);
                       },
                       child: Text(AppLocalizations.of(context)!.createAccount,
                         style: TextStyle(
                             color: AppColors.yellow,
                             fontSize: 14,
                             fontWeight: FontWeight.w500
                         ),),
                     ),
                   ],
                 ),
                 SizedBox(height: 20,),
                 OrDivider(),
                 SizedBox(height: 20,),
                 DefaultElevatedButton(
                   label: AppLocalizations.of(context)!.loginWithGoogle,
                   onPressed:(){},
                   svgAsset: 'assets/icons/google_icon.svg',
                 ),
                 SizedBox(height: 40,),
                 LanguageSwitchRow(
                   currentLang: languageProvider.locale.languageCode,
                   onSelect: (lang) => languageProvider.changeLanguage(lang),
                 ),
               ],
              ),
            ),
          )
      ),
    );
  }
}
