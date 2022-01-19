import 'package:chopper/chopper.dart';
import 'package:watamuki/src/data/models/facility/facility.dart';
import 'package:watamuki/src/data/models/responses/list_response_modal.dart';

part 'facility_service.chopper.dart';

@ChopperApi(baseUrl: "/facilities")
abstract class FacilityService extends ChopperService {
  static FacilityService create([ChopperClient? client]) =>
      _$FacilityService(client);

  @Get(path: "/public")
  Future<Response<ListResponse<List<Facility>>>> getAllFacilities();
}
