import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/config/api/json_factory.dart';
import 'package:watamuki/src/core/QueryProviders/query_client_provider.dart';
import 'package:watamuki/src/injector.dart';

import 'src/App.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies("prod");

  runApp(
    QueryClientProvider(
      converter: JsonFactory()(),
      child: EasyLocalization(
        path: 'assets/translations',
        startLocale: const Locale('ja', 'JP'),
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ja', 'JP'),
        ],
        child: const App(),
      ),
    ),
  );
}
