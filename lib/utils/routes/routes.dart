import 'package:flutter/material.dart';
import 'package:poc_mvvm_provider/utils/routes/route_name.dart';
import 'package:poc_mvvm_provider/view/main_screen.dart';
import 'package:poc_mvvm_provider/view/favorite_screen.dart';
import 'package:poc_mvvm_provider/view/home_screen.dart';
import 'package:poc_mvvm_provider/view/login_screen.dart';
import 'package:poc_mvvm_provider/view/movie_detail_screen.dart';
import 'package:poc_mvvm_provider/view/setting_screen.dart';
import 'package:poc_mvvm_provider/view/signup_screen.dart';
import 'package:poc_mvvm_provider/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RouteName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RouteName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
      case RouteName.main:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Main());
      case RouteName.setting:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Setting());
      case RouteName.favorite:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Favorite());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
            backgroundColor: Colors.white,
          );
        });
    }
  }
}
