import 'package:watamuki/src/core/params/facility.dart';
import 'package:watamuki/src/core/resources/data_state.dart';
import 'package:watamuki/src/data/models/facility/facility.dart';

abstract class FacilityRepository {
  Future<ApiResponse<List<Facility>>> getAllPublicFacility(
      FacilityParams params);
}
