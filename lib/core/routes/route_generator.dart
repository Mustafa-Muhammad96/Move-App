import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/features/movie_details/data/data_sources/movies_remote_data_source.dart';
import 'package:movie_app/features/movie_details/data/repositories/movies_details_repositories.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/movie_details_screen.dart';
import 'package:movie_app/features/reset-password/ui/reset_password_screen.dart';
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
      case AppRoutes.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case AppRoutes.movieDetialsScreen:
        final movieId = settings.arguments as int?;
        if (movieId == null) {
          return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: Center(child: Text("No movie ID passed"))),
          );
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => MovieDetailsCubit(
              MoviesDetailsRepositoryImpl(MoviesRemoteDataSource(dio: Dio())),
            )..fetchMovieDetails(movieId),
            child: const MovieDetailsScreen(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
