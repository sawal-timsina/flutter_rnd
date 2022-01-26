import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:watamuki/src/config/api/json_factory.dart';
import 'package:watamuki/src/core/params/index.dart';
import 'package:watamuki/src/core/resources/data_state.dart';
import 'package:watamuki/src/injector.dart';

class QueryObject<T> {
  T? data;
  bool isLoading;
  bool isFetching;

  QueryObject({this.data, required this.isLoading, required this.isFetching});
}

class QueryContext {
  List<dynamic> queries;

  QueryContext({
    required this.queries,
  });
}

class QueryProvider<T extends dynamic> {
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
  void Function(ErrorResponse error)? onError;
  bool fetchOnMount;

  late final Future Function() refetch;

  QueryProvider(
    this._query,
    this._queryFn, {
    this.params,
    this.fetchOnMount = true,
    this.onSuccess,
    this.onError,
    this.select,
  }) {
    refetch = () async {
      _queryKey = [_query, params?.toJson()].toString();
      _queryContext = QueryContext(queries: [_query, params]);

      final hasData = sharedPreferences.containsKey(_queryKey);
      if (hasData) {
        T cacheData = jsonFactory
            .convert<T>(jsonDecode(sharedPreferences.get(_queryKey) as String));
        _data.add(
            QueryObject(isLoading: false, isFetching: true, data: cacheData));
      } else {
        _data.add(QueryObject(isLoading: true, isFetching: true));
      }

      try {
        final res = await _queryFn(context: _queryContext);
        final data = select!(res.data) ?? res.data;
        final parsedData = jsonFactory.convert<T>(data);

        _data.add(
            QueryObject(isLoading: false, isFetching: false, data: parsedData));
        sharedPreferences.setString(_queryKey, jsonEncode(parsedData));

        if (onSuccess != null) onSuccess!(parsedData);
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        if (onError != null) onError!(const ErrorResponse("Shit happened"));
      }
    };

    if (fetchOnMount) {
      refetch();
    }
  }
}
