import 'package:watamuki/src/core/resources/data_state.dart';

class DataResponse<T> extends DataSuccess<T> {
  DataResponse({required T data}) : super(data);

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) =>
      DataResponse<T>(
        data: fromJsonT(json['data']),
      );

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      <String, dynamic>{
        'data': toJsonT(data as T),
      };
}
