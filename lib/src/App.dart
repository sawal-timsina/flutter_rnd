import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:watamuki/src/core/params/index.dart';
import 'package:watamuki/src/core/resources/data_state.dart';
import 'package:watamuki/src/injector.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'presentation/pages/home.dart';
import 'presentation/pages/onboarding.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/onboarding_provider.dart';

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
              return AppRouter.onGenerateRoutes(
                  settings, Provider.of<AuthProvider>(context).loggedIn);
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
