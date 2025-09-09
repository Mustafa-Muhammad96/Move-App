import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';

import '../../features/forget_password/ui/forget_password.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/login/presentation/screens/login_screen.dart';
import '../../features/profile/ui/update_profile_screen.dart';
import '../../features/register/presentation/screens/register_screen.dart';

class RoutGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
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
