// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$UserService extends UserService {
  _$UserService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UserService;

  @override
  Future<Response<DataResponse<UserModal>>> getAuthUser() {
    final $url = '/users/auth';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<DataResponse<UserModal>, UserModal>($request);
  }
}
