import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/or_divider.dart';
import 'package:movie_app/features/login/data/models/login_request.dart';
import 'package:movie_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:movie_app/features/login/presentation/cubit/login_states.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:movie_app/core/widgets/default_text_form_field.dart';
import 'package:movie_app/core/widgets/default_elevated_button.dart';
import 'package:provider/provider.dart';
import '../../../../../providers/language_provider.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/lang_toggle.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoginCubit(),
    child: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(
              context, AppRoutes.homeScreen);
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state)
        {
          final languageProvider = Provider.of<LanguageProvider>(context);
          return Scaffold(
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Stack(
                    children:
                   [
                     SingleChildScrollView(
                       child: Form(
                         key: _formKey,
                         child: Column(
                           children: [
                             SizedBox(height: 40,),
                             Image.asset('assets/images/login_1.png'),
                             SizedBox(height: 50),
                             DefaultTextFormField(
                               controller: _emailController,
                               hintText: AppLocalizations.of(context)!.email,
                               iconName: 'email',
                               validator: (value) {
                                 if (value == null || value.length < 5) {
                                   return AppLocalizations.of(context)!
                                       .invalidEmail;
                                 }
                                 return null;
                               },
                             ),
                             SizedBox(height: 20),
                             DefaultTextFormField(
                               controller: _passwordController,
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
                                   onTap: () {
                                     Navigator.of(context).pushNamed(
                                         AppRoutes.forgetPassword);
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
                                   onPressed: () {
                                     if (_formKey.currentState!.validate()) {
                                       final email = _emailController.text;
                                       final password = _passwordController.text;
                                       context.read<LoginCubit>().login(
                                           LoginRequest(
                                               email: email, password: password));
                                     }
                                   }
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
                                   onTap: () {
                                     Navigator.of(context).pushNamed(
                                         AppRoutes.registerScreen);
                                   },
                                   child: Text(
                                     AppLocalizations.of(context)!.createAccount,
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
                               label: AppLocalizations.of(context)!
                                   .loginWithGoogle,
                               onPressed: () {},
                               svgAsset: 'assets/icons/google_icon.svg',
                             ),
                             SizedBox(height: 40,),
                             LanguageSwitchRow(
                               currentLang: languageProvider.locale.languageCode,
                               onSelect: (lang) =>
                                   languageProvider.changeLanguage(lang),
                             ),
                           ],
                         ),
                       ),
                     ),
                     if (state is LoginLoading)
                       Center(
                         child: Container(
                           height: 200,
                           width: 200,
                           decoration: BoxDecoration(
                             color: AppColors.white,
                             borderRadius: BorderRadius.circular(12)
                           ),
                           child: const Center(
                             child: CircularProgressIndicator(color: AppColors.yellow),
                           ),
                         ),
                       ),
                   ]
                  ),
                )
            ),
          );
        })
    );}
}
