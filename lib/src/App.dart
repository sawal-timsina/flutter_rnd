import 'package:easy_localization/easy_localization.dart'
    show BuildContextEasyLocalizationExtension, tr;
import 'package:flutter/foundation.dart' show Key, kDebugMode;
import 'package:flutter/material.dart'
    show BuildContext, FocusManager, Key, MaterialApp, StatelessWidget, Widget;
import 'package:form_builder_validators/form_builder_validators.dart'
    show FormBuilderLocalizations;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, Provider, WatchContext;
import 'package:sizer/sizer.dart' show Sizer;

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'pages/home.dart';
import 'pages/onboarding.dart';
import 'providers/auth_provider.dart';
import 'providers/onboarding_provider.dart';

class App extends StatelessWidget {
  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      builder: (context, child) {
        return Sizer(builder: (_, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: kDebugMode,
            title: tr("Watamuki"),
            theme: AppTheme.light,
            initialRoute:
                context.watch<OnboardingProvider>().shouldShowOnboardingPage
                    ? Onboarding.routeName
                    : HomePage.routeName,
            onGenerateRoute: (settings) {
              return AppRouter.onGenerateRoutes(settings,
                  Provider.of<AuthProvider>(context, listen: false).loggedIn);
            },
            localizationsDelegates: [
              FormBuilderLocalizations.delegate,
              ...context.localizationDelegates
            ],
            supportedLocales: context.supportedLocales,
          );
        });
      },
    );
  }
}
