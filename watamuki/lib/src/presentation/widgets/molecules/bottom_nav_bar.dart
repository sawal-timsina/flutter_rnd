import 'package:flutter/material.dart';
import 'package:watamuki/src/config/routes/app_routes.dart';
import 'package:watamuki/src/presentation/pages/home_pages/coupon.dart';
import 'package:watamuki/src/presentation/pages/home_pages/facilities.dart';
import 'package:watamuki/src/presentation/pages/home_pages/home_navigator.dart';
import 'package:watamuki/src/presentation/pages/home_pages/stamp.dart';
import 'package:watamuki/src/presentation/pages/home_pages/top.dart';

class BottomNavBar extends StatefulWidget {
  final HomePage homePage;

  BottomNavBar({
    Key? key,
    required this.homePage,
  }) : super(key: key) {
    print(homePage.routes);
  }

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24), topLeft: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            offset: Offset(0, -8),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24), topLeft: Radius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: BottomNavigationBar(
            currentIndex: widget.homePage.currentIndex,
            onTap: (value) {
              String currentRoute = AppRouter.bottomNavRoutes[value];
              bool contains = widget.homePage.containsRoute(currentRoute);

              switch (currentRoute) {
                case TopPage.routeName:
                  if (contains) {
                    homeNavigator.currentState?.pushNamed(TopPage.routeName);
                    return;
                  }
                  homeNavigator.currentState
                      ?.restorablePushNamed(TopPage.routeName);
                  break;
                case CouponPage.routeName:
                  if (contains) {
                    return;
                  }
                  homeNavigator.currentState
                      ?.restorablePushNamed(CouponPage.routeName);
                  break;
                case StampPage.routeName:
                  if (contains) {
                    return;
                  }
                  homeNavigator.currentState
                      ?.restorablePushNamed(StampPage.routeName);
                  break;
                case FacilitiesPage.routeName:
                  if (contains) {
                    return;
                  }
                  homeNavigator.currentState
                      ?.restorablePushNamed(FacilitiesPage.routeName);
                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Top',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_activity_outlined),
                label: 'Coupon',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_police_outlined),
                label: 'Stamp',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                label: 'Facilities',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class _BottomNavBarState extends State<BottomNavBar> {
  HomePage _homePage = HomePage([TopPage.routeName], 0);

  @override
  void initState() {
    super.initState();
    widget.tabsChangeNotifier.addListener(() {
      print("bottom nav state changed");
      setState(() {
        _homePage = widget.tabsChangeNotifier.value;
      });
    });
  }
}
*/
