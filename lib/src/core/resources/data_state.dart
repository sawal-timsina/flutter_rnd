abstract class ApiResponse<T> {
  final T? data;
  final String? msg;

  const ApiResponse({this.data, this.msg});
}

class SuccessResponse<T> extends ApiResponse<T> {
  const SuccessResponse(T data) : super(data: data);
}

class ErrorResponse<T> extends ApiResponse<T> {
  const ErrorResponse(String msg) : super(msg: msg);
}
