import 'package:watamuki/src/core/resources/data_state.dart';
import 'package:watamuki/src/data/models/user/user.dart';

abstract class UserRepository {
  Future<ApiResponse<User>> getDbUser();
}
