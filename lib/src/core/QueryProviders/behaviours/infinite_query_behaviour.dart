import '../behaviours/behaviour.dart';

class InfiniteQueryParams {
  final bool hasNextPage;
  final dynamic nextPageParams;
  final String queryKey;

  InfiniteQueryParams(this.hasNextPage, this.nextPageParams, this.queryKey);
}

class InfiniteQueryBehaviour<T extends dynamic> extends Behaviour<List<T>> {
  final dynamic Function(T lastPage)? _getNextPageParam;
  void Function(InfiniteQueryParams infiniteQueryParams)? onNextPageParams;

  final Map<String, List> paramsList = {};

  InfiniteQueryBehaviour(this._getNextPageParam);

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
