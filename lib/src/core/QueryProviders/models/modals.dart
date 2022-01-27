class QueryObject<T> {
  T? data;
  bool isLoading;
  bool isFetching;

  QueryObject({this.data, required this.isLoading, required this.isFetching});
}

class QueryContext {
  List<dynamic> pageParam;

  QueryContext({
    required this.pageParam,
  });
}
