import 'package:flutter/material.dart';
import 'package:watamuki/src/config/routes/app_routes.dart';
import 'package:watamuki/src/presentation/pages/home_pages/coupon.dart';
import 'package:watamuki/src/presentation/pages/home_pages/facilities.dart';
import 'package:watamuki/src/presentation/pages/home_pages/stamp.dart';
import 'package:watamuki/src/presentation/pages/home_pages/top.dart';

class BottomNavProvider with ChangeNotifier {
  final List<String> _routeHistory = [];
  int _selectedIndex = 0;

  void add(String route) {
    _routeHistory.add(route);
    switch (route) {
      case TopPage.routeName:
      case CouponPage.routeName:
      case StampPage.routeName:
      case FacilitiesPage.routeName:
        _selectedIndex = AppRouter.bottomNavRoutes.indexOf(route);
        break;
    }
    notifyListeners();
  }

  void removeLast() {
    _routeHistory.removeLast();
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  bool containsRoute(String route) => _routeHistory.contains(route);
}
