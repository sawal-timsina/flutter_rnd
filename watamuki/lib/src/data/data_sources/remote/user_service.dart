import 'package:chopper/chopper.dart';
import 'package:watamuki/src/data/models/responses/data_response_modal.dart';
import 'package:watamuki/src/data/models/user_modal.dart';

part 'user_service.chopper.dart';

@ChopperApi(baseUrl: "/users")
abstract class UserService extends ChopperService {
  static UserService create([ChopperClient? client]) => _$UserService(client);

  @Get(path: "/auth")
  Future<Response<DataResponse<UserModal>>> getAuthUser();
}
