import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watamuki/src/config/routes/app_routes.dart';

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return const Navigator(
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
