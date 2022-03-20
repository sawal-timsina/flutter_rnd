import 'package:dio/dio.dart';
import 'package:query_provider/models/query_context.dart';
import 'package:watamuki/src/config/api/api.dart';

abstract class IUserService {
  Future<Response> getAuthUser({QueryContext? context});
}

class UserService extends IUserService {
  @override
  Future<Response> getAuthUser({QueryContext? context}) {
    final params = context?.queryKey[1];
    return dio.get("/users/auth",
        queryParameters: params != null ? params.toJson() : {});
  }
}
