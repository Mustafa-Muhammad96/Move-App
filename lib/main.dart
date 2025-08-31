import 'package:flutter/material.dart';
import 'package:movie_app/core/features/login/login_screen.dart';
import 'package:movie_app/l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie-App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      routes: {
        LoginScreen.routeName : (_) => LoginScreen()
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}

