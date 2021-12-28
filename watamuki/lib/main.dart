import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'src/config/routes/app_routes.dart';
import 'src/config/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final bool shouldShowOnboardingPage =
      sharedPreferences.getBool('shouldShowOnboardingPage') ?? true;

  runApp(Application(
    shouldShowOnboardingPage: shouldShowOnboardingPage,
  ));
}

class Application extends StatelessWidget {
  final bool shouldShowOnboardingPage;

  const Application({Key? key, required this.shouldShowOnboardingPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: kDebugMode,
        title: "Watamuki",
        theme: AppTheme.light,
        initialRoute: shouldShowOnboardingPage ? "/onboarding" : "/",
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      );
    });
  }
}
