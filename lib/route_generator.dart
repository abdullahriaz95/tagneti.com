import 'package:abdullahriaz95_dot_com/ui/home_page.dart';
import 'package:abdullahriaz95_dot_com/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => Splash());
      default:
        return null;
    }
  }
}
