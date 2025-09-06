import 'package:finalproject/routes/app_routes_name.dart';
import 'package:finalproject/views/home_view.dart';
import 'package:finalproject/views/login_view.dart';
import 'package:finalproject/views/quiz_view.dart';
import 'package:finalproject/views/register_view.dart';
import 'package:finalproject/views/splash_view.dart';
import 'package:finalproject/views/user_details_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
        AppRoutesName.initialRouteName: (context) => const SplashView(),
        AppRoutesName.loginRouteName: (context) => const LoginView(),
        AppRoutesName.signinRouteName: (context) => const RegisterView(),
        AppRoutesName.homeRouteName: (context) => const HomeView(),
        AppRoutesName.quizRouteName: (context) => const QuizView(),
        AppRoutesName.userDetailsRouteName:
            (context) => const UserDetailsView(),
      };
}
