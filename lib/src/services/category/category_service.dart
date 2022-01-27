import 'package:dio/dio.dart';
import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/core/QueryProviders/models/query_context.dart';

abstract class ICategoryService {
  Future<Response> getAllCategory({QueryContext? context});
}

class CategoryService extends ICategoryService {
  @override
  Future<Response> getAllCategory({QueryContext? context}) {
    final params = context?.pageParam[1];
    return dio.get("/categories/public",
        queryParameters: params != null ? params.toJson() : {});
  }
}
