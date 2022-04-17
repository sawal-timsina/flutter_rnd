import 'package:easy_localization/easy_localization.dart' show EasyLocalization;
import 'package:flutter/material.dart'
    show Locale, WidgetsFlutterBinding, runApp;
import 'package:query_provider/query_client_provider.dart';

import 'src/App.dart';
import 'src/config/config.dart';
import 'src/core/utils/json_factory.dart';
import 'src/core/utils/shared_preferences_cache_manager.dart';
import 'src/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(
    QueryClientProvider(
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
        child: const App(),
      ),
    ),
  );
}
