import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/features/profile/ui/update_profile_screen.dart';
import 'package:movie_app/core/routes/routes.dart';
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
      title: 'Move-App',
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.CustomeDarkTheme,
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      routes: {
        AppRoutes.UpdateProfileScreen: (_) => UpdateProfileScreen(),
      },
      initialRoute: AppRoutes.UpdateProfileScreen,
    );
  }
}
