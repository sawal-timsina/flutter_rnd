import 'package:flutter/material.dart'
    show BuildContext, Key, Scaffold, State, StatefulWidget, Widget;
import 'package:flutter/services.dart' show SystemChrome, SystemUiMode;

import '../widgets/molecules/header.dart';
import '../widgets/organisms/custom_drawer.dart';
import 'home_pages/home_navigator.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  HomePage({Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      drawer: CustomDrawer(),
      body: HomeNavigator(),
    );
  }
}
