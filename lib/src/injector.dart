import 'package:easy_localization/easy_localization.dart' show EasyLocalization;
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:query_provider/query_client_provider.dart' show QueryClientProvider;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

import 'config/api/api.dart';
import 'core/utils/json_factory.dart';
import 'core/utils/shared_preferences_cache_manager.dart';

late SharedPreferences sharedPreferences;

Future<void> initializeDependencies() async {
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  await Firebase.initializeApp();

  QueryClientProvider(
    converter: JsonFactory()(),
    cacheManager: SharedPreferencesCacheManager(),
  );
  // init dio
  InitDio()();

  sharedPreferences = await SharedPreferences.getInstance();
}
