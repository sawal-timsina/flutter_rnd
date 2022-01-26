import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watamuki/src/widgets/molecules/header.dart';
import 'package:watamuki/src/widgets/organisms/custom_drawer.dart';

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
