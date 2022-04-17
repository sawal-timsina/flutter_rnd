import 'package:flutter/material.dart';

import '../../pages/auth/login.dart';
import '../../pages/auth/register.dart';
import '../../pages/demo.dart';
import '../../pages/home.dart';
import '../../pages/home_pages/coupon.dart';
import '../../pages/home_pages/facilities.dart';
import '../../pages/home_pages/facility_detail.dart';
import '../../pages/home_pages/special_feature.dart';
import '../../pages/home_pages/stamp.dart';
import '../../pages/home_pages/top.dart';
import '../../pages/home_pages/town_info_details.dart';
import '../../pages/home_pages/town_information.dart';
import '../../pages/onboarding.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoutes(
      RouteSettings settings, bool isLoggedIn) {
    if (!isLoggedIn) {
      switch (settings.name) {
        case LoginPage.routeName:
          return _materialRoute(LoginPage());
        case RegisterPage.routeName:
          return _materialRoute(RegisterPage());
      }
    }

    if (isLoggedIn) {
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

  static PageRouteBuilder<dynamic>? onGenerateBottomNavRoutes(
      RouteSettings settings, PageController tabController) {
    switch (settings.name) {
      case HomePage.routeName:
        return _homeRoute(
            PageView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const TopPage(),
                  CouponPage(),
                  const StampPage(),
                  FacilitiesPage(),
                ]),
            settings);
      case TownInformationPage.routeName:
        return _homeRoute(const TownInformationPage(), settings);
      case TownInfoDetailPage.routeName:
        return _homeRoute(const TownInfoDetailPage(), settings,
            hasHPadding: true);
      case SpecialFeaturePage.routeName:
        return _homeRoute(const SpecialFeaturePage(), settings,
            hasHPadding: true);
      case FacilityDetailPage.routeName:
        return _homeRoute(const FacilityDetailPage(), settings,
            hasHPadding: true);
      default:
        throw const FormatException('Route not found');
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static PageRouteBuilder<dynamic> _homeRoute(
      Widget view, RouteSettings settings,
      {bool hasHPadding = false}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          const padding = EdgeInsets.symmetric(vertical: 8);
          return Container(
            color: Colors.white,
            padding:
                hasHPadding ? padding.copyWith(left: 20, right: 20) : padding,
            child: view,
          );
        },
        settings: settings);
  }
}
