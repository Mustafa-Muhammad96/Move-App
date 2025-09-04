import 'package:flutter/material.dart';
import 'package:movie_app/core/features/forget_password/forget_password.dart';
import 'package:movie_app/core/features/home/home_screen.dart';
import 'package:movie_app/core/features/login/login_screen.dart';
import 'package:movie_app/core/features/profile/ui/update_profile_screen.dart';
import 'package:movie_app/core/features/register/register_screen.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:movie_app/providers/langauge_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final seen = prefs.getBool("onboarding_seen") ?? false;

  runApp(ChangeNotifierProvider(
      create: (_) => LanguageProvider(), child: MyApp(seenOnboarding: seen)));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  const MyApp({super.key, required this.seenOnboarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      title: 'Movie-App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: languageProvider.locale,
      onGenerateRoute: RoutGenerator.getRoute,
      darkTheme: AppTheme.CustomeDarkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: LoginScreen.routeName,
      theme: AppTheme.CustomeLightTheme,
    );
  }
}
