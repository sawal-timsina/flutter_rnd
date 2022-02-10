import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

import '../behaviours/behaviour.dart';
import '../converters/converter_not_found.dart';
import '../models/params.dart';
import '../models/query_context.dart';
import '../models/query_object.dart';
import '../providers/base_provider.dart';
import '../query_client_provider.dart';
import '../utils/cache_manager.dart';
import 'base_provider.dart';

class BaseQueryProvider<T extends dynamic> implements BaseProvider {
  final CacheManager _cacheManager = getItQuery.get<CacheManager>();
  late final Behaviour _behaviour;

  String _queryKey = "";
  late final String _query;
  late Params? params;

  final BehaviorSubject<QueryObject<T>> _data = BehaviorSubject();

  Stream<QueryObject<T>> get dataStream => _data.stream;

  QueryObject<T> get data => _data.value;

  final Future<dynamic> Function({QueryContext context}) _queryFn;

  dynamic Function(Map<String, dynamic>)? select;

  void Function(T data)? onSuccess;
  void Function(Exception error)? onError;

  BaseQueryProvider(
    this._behaviour,
    this._query,
    this._queryFn, {
    this.params,
    bool fetchOnMount = true,
    this.onSuccess,
    this.onError,
    this.select,
  }) {
    if (fetchOnMount) {
      fetch();
    }
  }

  @override
  Future refetch() {
    return fetch(forceRefresh: true);
  }

  Future fetch({bool forceRefresh = false, QueryContext? queryContext}) async {
    _queryKey = [_query, params?.toJson()].toString();

    final _forceRefresh =
        forceRefresh ? true : !_cacheManager.containsKey(_queryKey);
    if (!_forceRefresh) {
      try {
        final cacheData =
            _behaviour.parseCacheData(_cacheManager.get(_queryKey));

        _data.add(
            QueryObject(isLoading: false, isFetching: true, data: cacheData));
        if (onSuccess != null) onSuccess!(cacheData!);
      } on ConverterNotFountException catch (e) {
        debugPrint(e.message);
      }
    } else {
      _data.add(QueryObject(isLoading: true, isFetching: true));
    }

    try {
      final parsedData = await behaviour.onFetch(BehaviourContext<T>(
          _queryFn,
          _queryKey,
          QueryContext(
            queryKey: [_query, params?.clone()],
            pageParam: queryContext?.pageParam,
          ),
          select,
          _data.value.data,
          _forceRefresh));

      _data.add(
          QueryObject(isLoading: false, isFetching: false, data: parsedData));
      _cacheManager.set(_queryKey, parsedData);

      if (onSuccess != null) onSuccess!(parsedData!);
    } on Exception catch (e) {
      if (e is ConverterNotFountException) {
        debugPrint(e.message);
      }
      if (onError != null) onError!(e);
    }
  }

  @override
  void clearCache() {
    if (_queryKey.isNotEmpty) {
      _cacheManager.remove(_queryKey);
    }
  }

  @override
  void revalidateCache() {
    if (_queryKey.isNotEmpty) {
      _cacheManager.remove(_queryKey);
      refetch();
    }
  }

  Behaviour get behaviour => _behaviour;
}
