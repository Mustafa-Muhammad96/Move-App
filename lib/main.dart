import 'package:flutter/material.dart';
import 'package:movie_app/core/features/home/home_screen.dart';
import 'package:movie_app/core/features/login/login_screen.dart';
import 'package:movie_app/core/features/register/register_screen.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:movie_app/core/features/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs=await SharedPreferences.getInstance();
  final seen= prefs.getBool("onboarding_seen")??false;

  runApp( MyApp(seenOnboarding: seen));
}

class MyApp extends StatelessWidget {
 final bool seenOnboarding;
  const MyApp({super.key, required this.seenOnboarding});

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
          LoginScreen.routeName: (_) => LoginScreen(),
          RegisterScreen.routeName: (_) => RegisterScreen(),
          HomeScreen.routeName: (_) => HomeScreen()
        },
        initialRoute: RegisterScreen.routeName,
        theme: AppTheme.CustomeLightTheme,
        darkTheme: AppTheme.CustomeDarkTheme,
        themeMode: ThemeMode.dark);
  }
}
