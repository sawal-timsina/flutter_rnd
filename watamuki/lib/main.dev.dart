import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watamuki/src/App.dart';
import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/config/api/json_converters.dart';
import 'package:watamuki/src/config/firebase/default_firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  await dotenv.load(fileName: ".dev.env");

  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.options(dotenv.env),
  );

  // init api
  Api(
    baseUrl: dotenv.env["API_URL"].toString(),
    converter: JsonConverters()(),
  );

  runApp(
    EasyLocalization(
      startLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ja', 'JP'),
      ],
      path: 'assets/translations',
      child: App(sharedPreferences: sharedPreferences),
    ),
  );
}
