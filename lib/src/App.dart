import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:watamuki/src/config/config.dart';
import 'package:watamuki/src/core/QueryProviders/query_client_provider.dart';
import 'package:watamuki/src/core/utils/json_factory.dart';
import 'package:watamuki/src/core/utils/shared_preferences_cache_manager.dart';

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
    return QueryClientProvider(
      converter: JsonFactory()(),
      cacheManager: SharedPreferencesCacheManager(),
      child: EasyLocalization(
        path: 'assets/translations',
        useOnlyLangCode: true,
        startLocale: const Locale(Config.locale),
        supportedLocales: const [
          Locale('en'),
          Locale('ja'),
        ],
        child: MultiProvider(
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
                      settings,
                      Provider.of<AuthProvider>(context, listen: false)
                          .loggedIn);
                },
                localizationsDelegates: [
                  FormBuilderLocalizations.delegate,
                  ...context.localizationDelegates
                ],
                supportedLocales: context.supportedLocales,
              );
            });
          },
        ),
      ),
    );
  }
}
