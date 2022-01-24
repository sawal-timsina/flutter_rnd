import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:watamuki/src/App.dart';
import 'package:watamuki/src/config/firebase/default_firebase_options.dart';
import 'package:watamuki/src/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await dotenv.load(fileName: ".dev.env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.options(dotenv.env),
  );

  await initializeDependencies();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      startLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ja', 'JP'),
      ],
      child: const App(),
    ),
  );
}
