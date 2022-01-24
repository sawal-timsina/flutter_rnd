import 'dart:io' show HttpException, HttpStatus;

import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/core/resources/data_state.dart';
import 'package:watamuki/src/data/data_sources/remote/user/user_service.dart';
import 'package:watamuki/src/data/models/user/user.dart';
import 'package:watamuki/src/data/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService userService = kAPI.getService<UserService>();

  @override
  Future<ApiResponse<User>> getDbUser() async {
    try {
      final response = await userService.getAuthUser();

      if (response.statusCode != HttpStatus.ok) {
        return ErrorResponse(response.bodyString);
      }

      return SuccessResponse<User>(response.body?.data as User);
    } on HttpException catch (e) {
      return ErrorResponse(e.message);
    }
  }
}
