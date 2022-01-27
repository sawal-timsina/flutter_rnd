import 'package:dio/dio.dart';
import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/core/QueryProviders/models/modals.dart';

abstract class IFacilityService {
  Future<Response> getAllFacilities({QueryContext? context});
}

class FacilityService extends IFacilityService {
  @override
  Future<Response> getAllFacilities({QueryContext? context}) {
    final params = context?.pageParam[1];
    return dio.get("/facilities/public",
        queryParameters: params != null ? params.toJson() : {});
  }
}
