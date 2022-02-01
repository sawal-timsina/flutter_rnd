import '../behaviours/behaviour.dart';

class QueryBehaviour<T extends dynamic> extends Behaviour<T> {
  @override
  T parseCacheData(data) {
    return converter.convert<T>(data);
  }

  @override
  T parseData(data, previousData) {
    return converter.convert<T>(data);
  }
}
