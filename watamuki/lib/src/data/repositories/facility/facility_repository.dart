import 'package:watamuki/src/core/resources/data_state.dart';
import 'package:watamuki/src/data/models/facility/facility.dart';

abstract class FacilityRepository {
  Future<DataState<List<Facility>>> getAllPublicFacility();
}
