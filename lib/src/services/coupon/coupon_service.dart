import 'package:dio/dio.dart';
import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/core/QueryProviders/models/query_context.dart';
import 'package:watamuki/src/core/params/coupon.dart';

abstract class ICouponService {
  Future<Response> getAllCoupons({QueryContext? context});
}

class CouponService extends ICouponService {
  @override
  Future<Response> getAllCoupons({QueryContext? context}) {
    final params = context?.queryKey[1] as CouponParams;
    params.cursor = context?.pageParam ?? DateTime.now().toIso8601String();
    return dio.get(
        (params.categoryId! <= 0 ? "/stamp-rally-coupon" : "/coupons") +
            "/public",
        queryParameters: params.toJson());
  }
}
