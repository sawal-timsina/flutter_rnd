import 'package:dio/dio.dart';
import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/core/QueryProviders/models/query_context.dart';
import 'package:watamuki/src/core/params/facility.dart';

abstract class IFacilityService {
  Future<Response> getAllFacilities({QueryContext? context});
}

class FacilityService extends IFacilityService {
  @override
  Future<Response> getAllFacilities({QueryContext? context}) {
    final params = context?.queryKey[1] as FacilityParams;
    params.cursor =
        context?.pageParam ?? DateTime.now().toUtc().toIso8601String();
    return dio.get("/facilities/public", queryParameters: params.toJson());
  }
}
