import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:watamuki/src/injector.dart';

import 'converters/converter.dart';
import 'converters/converter_not_found.dart';
import 'models/params.dart';
import 'models/query_context.dart';
import 'models/query_object.dart';
import 'query_injectors.dart';

class QueryProvider<T extends dynamic> {
  final ResponseConverter converter = getItQuery.get<ResponseConverter>();

  late String _queryKey;
  late final String _query;
  late Params? params;
  late QueryContext _queryContext;

  final BehaviorSubject<QueryObject<T>> _data = BehaviorSubject();

  Stream<QueryObject<T>> get dataStream => _data.stream;

  QueryObject<T> get data => _data.value;

  final Future<Response> Function({QueryContext context}) _queryFn;

  dynamic Function(Map<String, dynamic>)? select;

  void Function(T data)? onSuccess;
  void Function(Exception error)? onError;
  bool fetchOnMount;

  late final Future Function() refetch;

  QueryProvider(this._query,
      this._queryFn, {
        this.params,
        this.fetchOnMount = true,
        this.onSuccess,
        this.onError,
        this.select,
      }) {
    refetch = () async {
      _queryKey = [_query, params?.toJson()].toString();
      _queryContext = QueryContext(pageParam: [_query, params]);

      final hasData = sharedPreferences.containsKey(_queryKey);
      if (hasData) {
        try {
          T cacheData = converter.convert<T>(
              jsonDecode(sharedPreferences.get(_queryKey) as String));
          _data.add(
              QueryObject(isLoading: false, isFetching: true, data: cacheData));
          if (onSuccess != null) onSuccess!(cacheData);
        } on ConverterNotFountException catch (e) {
          debugPrint(e.message);
        }
      } else {
        _data.add(QueryObject(isLoading: true, isFetching: true));
      }

      try {
        final res = await _queryFn(context: _queryContext);
        final data = select!(res.data) ?? res.data;
        final parsedData = converter.convert<T>(data);

        _data.add(
            QueryObject(isLoading: false, isFetching: false, data: parsedData));
        sharedPreferences.setString(_queryKey, jsonEncode(parsedData));

        if (onSuccess != null) onSuccess!(parsedData);
      } on Exception catch (e) {
        if (e is ConverterNotFountException) {
          debugPrint(e.message);
        }
        if (onError != null) onError!(e);
      }
    };

    if (fetchOnMount) {
      refetch();
    }
  }

  void clearCache() {
    sharedPreferences.remove(_queryKey);
  }
}
