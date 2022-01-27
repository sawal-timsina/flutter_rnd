import 'package:dio/dio.dart';
import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/core/QueryProviders/models/query_context.dart';

abstract class ICouponService {
  Future<Response> getAllCoupons({QueryContext? context});
}

class CouponService extends ICouponService {
  @override
  Future<Response> getAllCoupons({QueryContext? context}) {
    final params = context?.pageParam[1];
    return dio.get("/coupons/public",
        queryParameters: params != null ? params.toJson() : {});
  }
}
