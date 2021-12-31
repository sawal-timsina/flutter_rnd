import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/pages/home.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    if (kDebugMode) {
      switch (settings.name) {
        case '/login':
          return materialRoute(MyHomePage(title: 'Login'));
        case '/register':
          return materialRoute(MyHomePage(title: 'Register'));
      }
    }

    if (kReleaseMode) {
      switch (settings.name) {
        case '/update_profile':
          return materialRoute(MyHomePage(title: 'Update Profile'));
        case '/update_email':
          return materialRoute(MyHomePage(title: 'Update Email'));
      }
    }

    switch (settings.name) {
      case '/':
        return materialRoute(MyHomePage(title: 'Home'));
      default:
        throw const FormatException('Route not found');
    }
  }

  static Route<dynamic> materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
