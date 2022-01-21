import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/data/repositories/category/category_repository.dart';
import 'package:watamuki/src/data/repositories/category/category_repository_impl.dart';
import 'package:watamuki/src/data/repositories/user/user_repository.dart';
import 'package:watamuki/src/data/repositories/user/user_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // init api
  InitApi()();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());

  getIt.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
}
