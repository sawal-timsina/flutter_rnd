import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watamuki/src/config/routes/app_routes.dart';
import 'package:watamuki/src/presentation/widgets/molecules/bottom_nav_bar.dart';
import 'package:watamuki/src/presentation/widgets/molecules/header.dart';
import 'package:watamuki/src/presentation/widgets/organisms/custom_drawer.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/';

  MyHomePage({Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      drawer: CustomDrawer(),
      bottomNavigationBar: BottomNavBar(),
      body: Navigator(
        initialRoute: 'top',
        onGenerateRoute: AppRouter.onGenerateBottomNavRoutes,
      ),
    );
  }
}
