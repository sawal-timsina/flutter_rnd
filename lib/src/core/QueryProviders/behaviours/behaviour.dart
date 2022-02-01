import '../converters/converter.dart';
import '../query_client_provider.dart';

abstract class Behaviour<T extends dynamic> {
  final ResponseConverter converter = getItQuery.get<ResponseConverter>();

  T parseCacheData(dynamic data);

  T parseData(dynamic data, dynamic previousData);
}
