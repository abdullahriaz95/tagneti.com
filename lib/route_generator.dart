import 'package:flutter/material.dart';
import 'package:tagneti/ui/home_page.dart';
import 'package:tagneti/ui/splash/splash.dart';

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
