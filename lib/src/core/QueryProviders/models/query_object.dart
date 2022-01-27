class QueryObject<T> {
  T? data;
  bool isLoading;
  bool isFetching;

  QueryObject({this.data, required this.isLoading, required this.isFetching});
}
