import 'package:dio/dio.dart';
import 'package:watamuki/src/core/QueryProviders/models/params.dart';

import 'behaviours/infinite_query_behaviour.dart';
import 'models/query_context.dart';
import 'providers/base_query_provider.dart';

class InfiniteQueryProvider<T extends dynamic>
    extends BaseQueryProvider<List<T>> {
  late final dynamic Function(T lastPage)? getNextPageParam;

  InfiniteQueryProvider(
    String query,
    Future<Response> Function({QueryContext context}) queryFn, {
    Params? params,
    bool fetchOnMount = true,
    void Function(List<T> data)? onSuccess,
    void Function(Exception error)? onError,
    dynamic Function(Map<String, dynamic>)? select,
    this.getNextPageParam,
  }) : super(
          InfiniteQueryBehaviour<T>(),
          query,
          queryFn,
          params: params,
          fetchOnMount: fetchOnMount,
          onSuccess: onSuccess,
          onError: onError,
          select: select,
        );
}
