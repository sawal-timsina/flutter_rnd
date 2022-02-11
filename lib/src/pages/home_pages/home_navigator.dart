import 'package:flutter/material.dart';
import 'package:watamuki/src/config/routes/app_routes.dart';
import 'package:watamuki/src/pages/home.dart';
import 'package:watamuki/src/widgets/molecules/bottom_nav_bar.dart';
import 'package:watamuki/src/widgets/organisms/double_back_to_close.dart';

final homeNavigator = GlobalKey<NavigatorState>();

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  final PageController _tabController = PageController();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool goBack() {
    bool? canGoBack = homeNavigator.currentState?.canPop();
    if (canGoBack!) {
      homeNavigator.currentState?.pop();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBackToClose(
      onBackPress: () async {
        return goBack();
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
            goBack();
          },
        ),
      ),
    );
  }
}
