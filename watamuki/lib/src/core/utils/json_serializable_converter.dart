import 'package:chopper/chopper.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, JsonFactory> _factories;

  const JsonSerializableConverter(this._factories);

  R? _decodeMap<R, I>(Map<String, dynamic> values) {
    final jsonFactory = _factories[R];
    if (jsonFactory == null || jsonFactory is! JsonFactory<R>) {
      return null;
    }

    return jsonFactory(values);
  }

  List<I> _decodeList<R, I>(List values) =>
      values.where((v) => v != null).map<I>((v) => _decode<R, I>(v)).toList();

  dynamic _decode<R, I>(entity) {
    if (entity is Iterable) {
      return _decodeList<R, I>(entity as List<dynamic>);
    }

    if (entity is Map) {
      return _decodeMap<R, I>(entity as Map<String, dynamic>);
    }

    return entity;
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    final jsonRes = super.convertResponse(response);

    return jsonRes.copyWith<ResultType>(
        body: _decode<ResultType, Item>(jsonRes.body));
  }
}
