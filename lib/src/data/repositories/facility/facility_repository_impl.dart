import 'dart:io' show HttpException, HttpStatus;

import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/core/resources/data_state.dart';
import 'package:watamuki/src/data/data_sources/remote/facility/facility_service.dart';
import 'package:watamuki/src/data/models/facility/facility.dart';
import 'package:watamuki/src/data/repositories/facility/facility_repository.dart';

class FacilityRepositoryImpl with QueryProvider implements FacilityRepository {
  final FacilityService _facilityService = kAPI.getService<FacilityService>();

  @override
  Future<DataState<List<Facility>>> getAllPublicFacility(params) async {
    try {
      final response = await _facilityService.getAllFacilities(params.toJson());

      if (response.statusCode != HttpStatus.ok) {
        return DataError(response.bodyString);
      }

      return DataSuccess<List<Facility>>(response.body?.data as List<Facility>);
    } on HttpException catch (e) {
      return DataError(e.message);
    }
  }
}
