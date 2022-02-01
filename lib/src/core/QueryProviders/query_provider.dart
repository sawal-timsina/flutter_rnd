import 'package:dio/dio.dart';
import 'package:watamuki/src/core/QueryProviders/behaviours/query_behaviour.dart';

import 'models/params.dart';
import 'models/query_context.dart';
import 'providers/base_query_provider.dart';

class QueryProvider<T extends dynamic> extends BaseQueryProvider<T> {
  QueryProvider(
    String query,
    Future<Response> Function({QueryContext context}) queryFn, {
    Params? params,
    bool fetchOnMount = true,
    void Function(T data)? onSuccess,
    void Function(Exception error)? onError,
    dynamic Function(Map<String, dynamic>)? select,
  }) : super(
          QueryBehaviour<T>(),
          query,
          queryFn,
          params: params,
          fetchOnMount: fetchOnMount,
          onSuccess: onSuccess,
          onError: onError,
          select: select,
        );
}
