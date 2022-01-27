import 'package:dio/dio.dart';
import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/core/QueryProviders/models/query_context.dart';

abstract class IUserService {
  Future<Response> getAuthUser({QueryContext? context});
}

class UserService extends IUserService {
  @override
  Future<Response> getAuthUser({QueryContext? context}) {
    final params = context?.pageParam[1];
    return dio.get("/users/auth",
        queryParameters: params != null ? params.toJson() : {});
  }
}
