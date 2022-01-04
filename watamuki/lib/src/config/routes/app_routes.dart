import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/pages/demo.dart';
import 'package:watamuki/src/presentation/pages/home.dart';
import 'package:watamuki/src/presentation/pages/home_pages/coupon.dart';
import 'package:watamuki/src/presentation/pages/home_pages/facilities.dart';
import 'package:watamuki/src/presentation/pages/home_pages/facility_detail.dart';
import 'package:watamuki/src/presentation/pages/home_pages/special_feature.dart';
import 'package:watamuki/src/presentation/pages/home_pages/stamp.dart';
import 'package:watamuki/src/presentation/pages/home_pages/top.dart';
import 'package:watamuki/src/presentation/pages/home_pages/town_info_details.dart';
import 'package:watamuki/src/presentation/pages/home_pages/town_information.dart';
import 'package:watamuki/src/presentation/pages/onboarding.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    if (kDebugMode) {
      switch (settings.name) {
        case 'login':
          return _materialRoute(const Demo(title: 'Login'));
        case 'register':
          return _materialRoute(const Demo(title: 'Register'));
      }
    }

    if (kReleaseMode) {
      switch (settings.name) {
        case 'update_profile':
          return _materialRoute(const Demo(title: 'Update Profile'));
        case 'update_mobile':
          return _materialRoute(const Demo(title: 'Update Mobile'));
        case 'update_password':
          return _materialRoute(const Demo(title: 'Update Password'));
        case 'update_email':
          return _materialRoute(const Demo(title: 'Update Email'));
      }
    }

    switch (settings.name) {
      case '/':
        return _materialRoute(HomePage());
      case Onboarding.routeName:
        return _materialRoute(Onboarding());
      case 'inquiry':
        final DemoScreenArguments args =
            settings.arguments as DemoScreenArguments;
        return _materialRoute(Demo(title: "Inquiry", args: args));
      case 'about':
        return _materialRoute(const Demo(title: "About"));
      case 'terms_and_condition':
        return _materialRoute(const Demo(title: "Terms and condition"));
      case 'privacy_policy':
        return _materialRoute(const Demo(title: "Privacy Policy"));
      case 'extra':
        return _materialRoute(const Demo(title: "Extra"));
      default:
        throw const FormatException('Route not found');
    }
  }

  static List<String> bottomNavRoutes = [
    TopPage.routeName,
    CouponPage.routeName,
    StampPage.routeName,
    FacilitiesPage.routeName,
  ];

  static PageRouteBuilder<dynamic> onGenerateBottomNavRoutes(
      RouteSettings settings) {
    switch (settings.name) {
      case TopPage.routeName:
        return _homeRoute(const TopPage(), settings);
      case CouponPage.routeName:
        return _homeRoute(const CouponPage(), settings);
      case StampPage.routeName:
        return _homeRoute(const StampPage(), settings);
      case FacilitiesPage.routeName:
        return _homeRoute(const FacilitiesPage(), settings);
      case TownInformationPage.routeName:
        return _homeRoute(const TownInformationPage(), settings);
      case TownInfoDetailPage.routeName:
        return _homeRoute(const TownInfoDetailPage(), settings);
      case SpecialFeaturePage.routeName:
        return _homeRoute(const SpecialFeaturePage(), settings);
      case FacilityDetailPage.routeName:
        return _homeRoute(const FacilityDetailPage(), settings);
      default:
        throw const FormatException('Route not found');
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static PageRouteBuilder<dynamic> _homeRoute(
      Widget view, RouteSettings settings) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return Container(
            color: Colors.white,
            child: view,
          );
        },
        settings: settings);
  }
}
