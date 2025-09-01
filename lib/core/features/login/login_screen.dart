import 'package:flutter/material.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login)
      ),
    );
  }
}
