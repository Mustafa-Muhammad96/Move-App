import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = AppRoutes.loginScreen;
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.login)),
    );
  }
}
