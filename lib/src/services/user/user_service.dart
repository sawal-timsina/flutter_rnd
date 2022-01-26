import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/config/api/json_factory.dart';
import 'package:watamuki/src/core/params/index.dart';
import 'package:watamuki/src/models/user/user.dart';

abstract class IUserService {
  Future<User> getAuthUser(Params? params);
}

class UserService extends IUserService {
  @override
  Future<User> getAuthUser(Params? params) async {
    final res = await dio.get("/users/auth",
        queryParameters: params != null ? params.toJson() : {});
    return jsonFactory.convert<User>(res.data["data"]);
  }
}
