import 'converter.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

typedef ListFactory<T> = T Function(List<dynamic> list);

class JsonConverter extends Converter {
  final Map<Type, JsonFactory> _jsonFactories;
  final Map<Type, ListFactory> _listFactories;

  JsonConverter(this._jsonFactories, this._listFactories);

  R? _decodeMap<R>(Map<String, dynamic> values) {
    final jsonFactory = _jsonFactories[R];
    if (jsonFactory == null) {
      return null;
    }
    return jsonFactory(values);
  }

  R? _decodeList<R>(List values) {
    final jsonFactory = _listFactories[R];
    if (jsonFactory == null) {
      return null;
    }
    return jsonFactory(values);
  }

  dynamic _decode<R>(entity) {
    if (entity is Iterable) {
      return _decodeList<R>(entity as List<dynamic>);
    }

    if (entity is Map) {
      return _decodeMap<R>(entity as Map<String, dynamic>);
    }

    return entity;
  }

  @override
  dynamic convert<ResultType>(dynamic data) {
    return _decode<ResultType>(data);
  }
}
