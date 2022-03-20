import 'package:dio/dio.dart';
import 'package:query_provider/models/query_context.dart';
import 'package:watamuki/src/config/api/api.dart';

abstract class ICategoryService {
  Future<Response> getAllCategory({QueryContext? context});
}

class CategoryService extends ICategoryService {
  @override
  Future<Response> getAllCategory({QueryContext? context}) {
    final params = context?.queryKey[1];
    return dio.get("/categories/public",
        queryParameters: params != null ? params.toJson() : {});
  }
}
