import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/pages/home.dart';
import 'package:watamuki/src/presentation/pages/onboarding.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    if (kDebugMode) {
      switch (settings.name) {
        case '/login':
          return _materialRoute(const MyHomePage(title: 'Login'));
        case '/register':
          return _materialRoute(const MyHomePage(title: 'Register'));
      }
    }

    if (kReleaseMode) {
      switch (settings.name) {
        case '/update_profile':
          return _materialRoute(const MyHomePage(title: 'Update Profile'));
        case '/update_email':
          return _materialRoute(const MyHomePage(title: 'Update Email'));
      }
    }

    switch (settings.name) {
      case '/onboarding':
        return _materialRoute(Onboarding());
      case '/':
        return _materialRoute(const MyHomePage(title: 'Home'));
      default:
        throw const FormatException('Route not found');
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
