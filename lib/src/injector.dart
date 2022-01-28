import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watamuki/src/config/api/api.dart';

import 'config/firebase/default_firebase_options.dart';

late SharedPreferences sharedPreferences;

Future<void> initializeDependencies(String env) async {
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  await dotenv.load(fileName: ".$env.env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.options(dotenv.env),
  );

  // init dio
  InitDio()();

  sharedPreferences = await SharedPreferences.getInstance();
}
