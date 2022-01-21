import 'package:watamuki/src/core/resources/data_state.dart';

class ListResponse<T> extends DataSuccess<T> {
  ListResponse({required T data}) : super(data);

  factory ListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Iterable<dynamic> list) fromJsonT,
  ) =>
      ListResponse<T>(
        data: fromJsonT(json['data']),
      );

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      <String, dynamic>{
        'data': toJsonT(data as T),
      };
}
