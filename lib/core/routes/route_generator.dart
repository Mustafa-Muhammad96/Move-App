import 'package:flutter/material.dart';
import 'package:movie_app/core/features/forget_password/forget_password.dart';
import 'package:movie_app/core/features/home/home_screen.dart';
import 'package:movie_app/core/features/login/login_screen.dart';
import 'package:movie_app/core/features/profile/ui/update_profile_screen.dart';
import 'package:movie_app/core/features/register/register_screen.dart';
import 'package:movie_app/core/routes/routes.dart';

class RoutGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.updateProfileScreen:
        return MaterialPageRoute(builder: (_) => UpdateProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
}
  }

}