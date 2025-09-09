import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/default_elevated_button.dart';
import 'package:movie_app/core/widgets/default_text_form_field.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import '../logic/reset_password_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (_) => ResetPasswordCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        appBar: AppBar(
          title: Text(
            loc.resetPassword,
            style: textTheme.titleMedium!.copyWith(color: AppColors.primary),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primary),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));

                // نخلي البوب يحصل بعد ما الرسالة تظهر بشوية صغيرين
                Future.delayed(const Duration(seconds: 1), () {
                  if (mounted) {
                    Navigator.pop(context);
                  }
                });
              } else if (state is ResetPasswordError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },

            builder: (context, state) {
              if (state is ResetPasswordLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    DefaultTextFormField(
                      controller: oldPasswordController,
                      hintText: loc.oldPassword,
                      iconName: 'password',
                      isPassword: true,
                      validator: (v) =>
                          v == null || v.isEmpty ? "Enter old password" : null,
                    ),
                    const SizedBox(height: 20),
                    DefaultTextFormField(
                      controller: newPasswordController,
                      hintText: loc.newPassword,
                      iconName: 'password',
                      isPassword: true,
                      validator: (v) => v == null || v.length < 8
                          ? loc.passwordMustBeAtLeast8Characters
                          : null,
                    ),
                    const SizedBox(height: 30),
                    DefaultElevatedButton(
                      label: loc.updatePassword,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ResetPasswordCubit>().resetPassword(
                            oldPasswordController.text.trim(),
                            newPasswordController.text.trim(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
