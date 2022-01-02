import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/pages/demo.dart';
import 'package:watamuki/src/presentation/pages/home.dart';
import 'package:watamuki/src/presentation/pages/home_pages/top.dart';
import 'package:watamuki/src/presentation/pages/onboarding.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    if (kDebugMode) {
      switch (settings.name) {
        case 'login':
          return materialRoute(const Demo(title: 'Login'));
        case 'register':
          return materialRoute(const Demo(title: 'Register'));
      }
    }

    if (kReleaseMode) {
      switch (settings.name) {
        case 'update_profile':
          return materialRoute(const Demo(title: 'Update Profile'));
        case 'update_mobile':
          return materialRoute(const Demo(title: 'Update Mobile'));
        case 'update_password':
          return materialRoute(const Demo(title: 'Update Password'));
        case 'update_email':
          return materialRoute(const Demo(title: 'Update Email'));
      }
    }

    switch (settings.name) {
      case '/':
        return materialRoute(MyHomePage());
      case Onboarding.routeName:
        return materialRoute(Onboarding());
      case 'inquiry':
        final DemoScreenArguments args =
            settings.arguments as DemoScreenArguments;
        return materialRoute(Demo(title: "Inquiry", args: args));
      case 'about':
        return materialRoute(const Demo(title: "About"));
      case 'terms_and_condition':
        return materialRoute(const Demo(title: "Terms and condition"));
      case 'privacy_policy':
        return materialRoute(const Demo(title: "Privacy Policy"));
      case 'extra':
        return materialRoute(const Demo(title: "Extra"));
      default:
        throw const FormatException('Route not found');
    }
  }

  static Route<dynamic> onGenerateBottomNavRoutes(RouteSettings settings) {
    switch (settings.name) {
      case 'top':
        return materialRoute(const Top());
      case 'coupon':
        return materialRoute(const Top());
      case 'stamp':
        return materialRoute(const Top());
      case 'facilities':
        return materialRoute(const Top());
      case 'facility_detail':
        final DemoScreenArguments args =
            settings.arguments as DemoScreenArguments;
        return materialRoute(Demo(title: "Inquiry", args: args));
      default:
        throw const FormatException('Route not found');
    }
  }

  static Route<dynamic> materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
