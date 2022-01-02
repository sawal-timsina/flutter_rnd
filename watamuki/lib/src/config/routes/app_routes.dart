import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/pages/demo.dart';
import 'package:watamuki/src/presentation/pages/home.dart';
import 'package:watamuki/src/presentation/pages/home_pages/coupon.dart';
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
        return materialRoute(HomePage());
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

  static PageRouteBuilder<dynamic> onGenerateBottomNavRoutes(
      RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case TopPage.routeName:
        page = const TopPage();
        break;
      case CouponPage.routeName:
        page = const CouponPage(title: "Coupon");
        break;
      case 'stamp':
        page = const CouponPage(title: "Stamp");
        break;
      case 'facilities':
        page = const CouponPage(title: "Facilities");
        break;
      case 'facility_detail':
        page = const CouponPage(title: "Facility Detail");
        break;
      case 'town_information':
        page = const CouponPage(title: "Town Information");
        break;
      case 'town_info_details':
        page = const CouponPage(title: "Town Information");
        break;
      case 'special_feature':
        page = const CouponPage(title: "Special Feature");
        break;
    }
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container(
          color: Colors.white,
          child: page,
        );
      },
      settings: settings,
    );
  }

  static Route<dynamic> materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
