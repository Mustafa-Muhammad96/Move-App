import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/validators/form_validators.dart';
import 'package:movie_app/core/widgets/default_elevated_button.dart';
import 'package:movie_app/core/widgets/default_text_form_field.dart';
import 'package:movie_app/features/register/data/repositories/register_repository_impl.dart';
import 'package:movie_app/features/register/presentation/cubit/register_cubit.dart';
import 'package:movie_app/features/register/presentation/cubit/register_state.dart';
import 'package:movie_app/features/register/data/data_sources/register_remote_data_source.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../../providers/language_provider.dart';
import '../../../../core/widgets/lang_toggle.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  int selectedAvatarId = 1;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) =>
          RegisterCubit(RegisterRepository(RegisterRemoteDataSource())),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Account Created Successfully")),
            );
            Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Error: ${state.message}")));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.backgroundDark,
              centerTitle: true,
              title: Text(AppLocalizations.of(context)!.register),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        child: CarouselSlider(
                          items: [1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAvatarId = i;
                                });
                              },
                              child: Image.asset(
                                'assets/images/avatar_$i.png',
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                width: MediaQuery.sizeOf(context).width * 0.4,
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.55,
                            viewportFraction: 0.37,
                          ),
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.avatar,
                        style: textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      DefaultTextFormField(
                        controller: nameController,
                        hintText: AppLocalizations.of(context)!.name,
                        iconName: 'name',
                        validator: FormValidators.validateName,
                      ),
                      const SizedBox(height: 20),
                      DefaultTextFormField(
                        controller: emailController,
                        hintText: AppLocalizations.of(context)!.email,
                        iconName: 'email',
                        validator: FormValidators.validateEmail,
                      ),
                      const SizedBox(height: 20),
                      DefaultTextFormField(
                        controller: passwordController,
                        isPassword: true,
                        hintText: AppLocalizations.of(context)!.password,
                        iconName: 'password',
                        validator: FormValidators.validatePassword,
                      ),
                      const SizedBox(height: 20),
                      DefaultTextFormField(
                        controller: confirmPasswordController,
                        isPassword: true,
                        hintText: AppLocalizations.of(context)!.confirmPassword,
                        iconName: 'password',
                        validator: (value) =>
                            FormValidators.validateConfirmPassword(
                              value,
                              passwordController.text,
                            ),
                      ),
                      const SizedBox(height: 20),
                      DefaultTextFormField(
                        controller: phoneController,
                        hintText: AppLocalizations.of(context)!.phone,
                        iconName: 'phone',
                        validator: FormValidators.validatePhone,
                      ),
                      const SizedBox(height: 20),
                      DefaultElevatedButton(
                        label: "Create Account",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<RegisterCubit>().register(
                              nameController.text.trim(),
                              emailController.text.trim(),
                              passwordController.text,
                              phoneController.text.trim(),
                              selectedAvatarId,
                            );
                          }
                        },
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
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.loginScreen);
                            },
                            child: Text(AppLocalizations.of(context)!.login),
                          ),
                        ],
                      ),
                      LanguageSwitchRow(
                        currentLang: languageProvider.locale.languageCode,
                        onSelect: (lang) =>
                            languageProvider.changeLanguage(lang),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
