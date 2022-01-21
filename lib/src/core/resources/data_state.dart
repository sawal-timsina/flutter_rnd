abstract class DataState<T> {
  final T? data;
  final String? msg;

  const DataState({this.data, this.msg});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  const DataError(String msg) : super(msg: msg);
}
