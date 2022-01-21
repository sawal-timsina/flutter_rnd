import 'package:chopper/chopper.dart';
import 'package:watamuki/src/data/data_sources/remote/category/category_service.dart';
import 'package:watamuki/src/data/data_sources/remote/user/user_service.dart';

import 'facility/facility_service.dart';

class Services {
  Iterable<ChopperService> call() {
    return [
      UserService.create(),
      CategoryService.create(),
      FacilityService.create(),
    ];
  }
}
