import 'package:easy_localization/easy_localization.dart' show EasyLocalization;
import 'package:flutter/material.dart'
    show Locale, WidgetsFlutterBinding, runApp;

import 'src/App.dart';
import 'src/config/config.dart';
import 'src/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      useOnlyLangCode: true,
      startLocale: const Locale(Config.locale),
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      child: const App(),
    ),
  );
}
