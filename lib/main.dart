import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:query_provider/query_client_provider.dart';
import 'package:watamuki/src/App.dart';
import 'package:watamuki/src/config/config.dart';
import 'package:watamuki/src/core/utils/json_factory.dart';
import 'package:watamuki/src/core/utils/shared_preferences_cache_manager.dart';
import 'package:watamuki/src/injector.dart';

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
