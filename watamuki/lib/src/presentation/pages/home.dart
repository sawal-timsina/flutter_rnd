import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watamuki/src/presentation/widgets/molecules/header.dart';
import 'package:watamuki/src/presentation/widgets/organisms/custom_drawer.dart';

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
    return Scaffold(
      appBar: const Header(),
      drawer: const CustomDrawer(),
      body: HomeNavigator(),
    );
  }
}
