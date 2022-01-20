// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$FacilityService extends FacilityService {
  _$FacilityService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FacilityService;

  @override
  Future<Response<ListResponse<List<Facility>>>> getAllFacilities(
      {String? area, int? categoryId}) {
    final $url = '/facilities/public';
    final $params = <String, dynamic>{'area': area, 'category_id': categoryId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ListResponse<List<Facility>>, Facility>($request);
  }
}
