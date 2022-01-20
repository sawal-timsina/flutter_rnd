import 'package:watamuki/src/core/params/facility.dart';
import 'package:watamuki/src/core/resources/data_state.dart';
import 'package:watamuki/src/data/models/facility/facility.dart';

abstract class FacilityRepository {
  Future<DataState<List<Facility>>> getAllPublicFacility(FacilityParams params);
}
