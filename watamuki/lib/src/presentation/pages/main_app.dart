import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watamuki/src/config/routes/app_routes.dart';

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    if (kDebugMode) {
      print({"home"});
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Navigator(
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
