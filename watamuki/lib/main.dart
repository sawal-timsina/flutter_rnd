import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:watamuki/src/config/routes/app_routes.dart';
import 'package:watamuki/src/presentation/pages/home.dart';

import 'src/config/themes/app_theme.dart';
import 'src/presentation/pages/onboarding.dart';
import 'src/presentation/providers/onboarding_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => OnboardingProvider(sharedPreferences),
      ),
    ],
    child: Sizer(builder: (_context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: kDebugMode,
        title: "Watamuki",
        theme: AppTheme.light,
        initialRoute:
            _context.watch<OnboardingProvider>().shouldShowOnboardingPage
                ? Onboarding.routeName
                : HomePage.routeName,
        onGenerateRoute: AppRouter.onGenerateRoutes,
      );
    }),
  ));
}
