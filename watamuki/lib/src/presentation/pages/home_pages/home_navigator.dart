import 'package:flutter/material.dart';
import 'package:watamuki/src/config/routes/app_routes.dart';
import 'package:watamuki/src/presentation/widgets/molecules/bottom_nav_bar.dart';

import 'coupon.dart';
import 'facilities.dart';
import 'stamp.dart';
import 'top.dart';

final homeNavigator = GlobalKey<NavigatorState>();

class HomePage {
  final List<String> _routes;
  late int currentIndex;

  HomePage(this._routes, this.currentIndex);

  List<String> get routes => _routes;

  void _onRouteChanged(String route) {
    switch (route) {
      case TopPage.routeName:
      case CouponPage.routeName:
      case StampPage.routeName:
      case FacilitiesPage.routeName:
        currentIndex = AppRouter.bottomNavRoutes.indexOf(route);
        break;
    }
  }

  String pop() {
    String route = _routes.removeLast();
    _onRouteChanged(_routes.last);
    return route;
  }

  void pushRoute(String route) {
    _routes.add(route);
    _onRouteChanged(route);
  }

  bool containsRoute(String route) {
    return _routes.contains(route);
  }
}

class HomeNavigator extends StatelessWidget {
  final ValueNotifier<HomePage> tabsChangeNotifier =
      ValueNotifier(HomePage([TopPage.routeName], 0));

  HomeNavigator({
    Key? key,
  }) : super(key: key) {
    tabsChangeNotifier.addListener(() {
      print("form notif");
      print(tabsChangeNotifier.value.routes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? canGoBack = homeNavigator.currentState?.canPop();
        // print(homeNavigator.currentState);
        if (canGoBack!) {
          homeNavigator.currentState?.pop();
        }
        return Future.value(!canGoBack);
      },
      child: Scaffold(
        extendBody: true,
        body: Navigator(
          key: homeNavigator,
          observers: [
            BottomNavigationObserver(
              (value) {
                if (!tabsChangeNotifier.value.containsRoute(value)) {
                  tabsChangeNotifier.value.pushRoute(value);
                  tabsChangeNotifier.notifyListeners();
                }
              },
              () {
                tabsChangeNotifier.value.pop();
                tabsChangeNotifier.notifyListeners();
              },
            ),
          ],
          initialRoute: TopPage.routeName,
          onGenerateRoute: AppRouter.onGenerateBottomNavRoutes,
        ),
        bottomNavigationBar: ValueListenableBuilder<HomePage>(
          valueListenable: tabsChangeNotifier,
          builder: (BuildContext context, HomePage value, Widget? child) {
            return BottomNavBar(
              homePage: value,
            );
          },
        ),
      ),
    );
  }
}

class BottomNavigationObserver extends NavigatorObserver {
  final Function(String route) onPush;
  final Function() onPop;

  BottomNavigationObserver(this.onPush, this.onPop);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("from didpush");
    onPush(route.settings.name.toString());
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPop();
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print("replaced");
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
