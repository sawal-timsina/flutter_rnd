import 'package:chopper/chopper.dart';
import 'package:watamuki/src/core/resources/data_response.dart';
import 'package:watamuki/src/data/models/user/user.dart';

part 'user_service.chopper.dart';

@ChopperApi(baseUrl: "/users")
abstract class UserService extends ChopperService {
  static UserService create([ChopperClient? client]) => _$UserService(client);

  @Get(path: "/auth")
  Future<Response<DataResponse<User>>> getAuthUser();
}
