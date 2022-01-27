import 'package:get_it/get_it.dart';

import 'converters/converter.dart';

final getItQuery = GetIt.instance;

void initDependency({required ResponseConverter converter}) {
  getItQuery.registerSingleton<ResponseConverter>(converter);
}
