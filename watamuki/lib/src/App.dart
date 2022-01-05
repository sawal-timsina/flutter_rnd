import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'presentation/pages/home.dart';
import 'presentation/pages/onboarding.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/onboarding_provider.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.sharedPreferences,
  }) : super(key: key);

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(sharedPreferences),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      builder: (context, child) {
        return Sizer(builder: (_, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: kDebugMode,
            title: "Watamuki",
            theme: AppTheme.light,
            initialRoute:
                context.watch<OnboardingProvider>().shouldShowOnboardingPage
                    ? Onboarding.routeName
                    : HomePage.routeName,
            onGenerateRoute: (settings) {
              bool loggedIn =
                  Provider.of<AuthProvider>(context, listen: false).loggedIn;
              return AppRouter.onGenerateRoutes(settings, loggedIn);
            },
          );
        });
      },
    );
  }
}
