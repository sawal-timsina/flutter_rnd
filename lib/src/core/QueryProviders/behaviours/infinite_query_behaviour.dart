import '../behaviours/behaviour.dart';

class InfiniteQueryBehaviour<T extends dynamic> extends Behaviour<List<T>> {
  @override
  List<T> parseCacheData(data) {
    return (data as List).map<T>((e) => converter.convert<T>(e)).toList();
  }

  @override
  List<T> parseData(data, previousData) {
    final parsedData = converter.convert<T>(data);

    List<T> tdList = previousData ?? [];
    // [1] check if new list's item are already present or not
    bool containsNew = (tdList.isEmpty
        ? false
        : tdList.every((element) {
            if (element is! List) return false;
            return element.every((ee) {
              return parsedData.contains(ee);
            });
          }));
    // [1]

    if (!containsNew) {
      tdList.add(parsedData);
    }
    return tdList;
  }
}
