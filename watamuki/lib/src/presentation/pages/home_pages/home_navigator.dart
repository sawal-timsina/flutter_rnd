import 'package:flutter/material.dart';
import 'package:watamuki/src/config/routes/app_routes.dart';
import 'package:watamuki/src/presentation/widgets/molecules/bottom_nav_bar.dart';

import '../home.dart';

final homeNavigator = GlobalKey<NavigatorState>();

class HomeNavigator extends StatelessWidget {
  HomeNavigator({
    Key? key,
  }) : super(key: key);

  final PageController _tabController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? canGoBack = homeNavigator.currentState?.canPop();
        if (canGoBack!) {
          homeNavigator.currentState?.pop();
          return Future.value(!canGoBack);
        }
        return Future.value(!canGoBack);
      },
      child: Scaffold(
        extendBody: true,
        body: Navigator(
          key: homeNavigator,
          initialRoute: HomePage.routeName,
          onGenerateRoute: (settings) =>
              AppRouter.onGenerateBottomNavRoutes(settings, _tabController),
        ),
        bottomNavigationBar: BottomNavBar(
          onTap: (index) {
            _tabController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
