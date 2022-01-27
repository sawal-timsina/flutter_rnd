import 'package:get_it/get_it.dart';
import 'package:watamuki/src/core/QueryProviders/Converters/converter.dart';

final getItQuery = GetIt.instance;

void initDependency({required Converter converter}) {
  getItQuery.registerSingleton<Converter>(converter);
}
