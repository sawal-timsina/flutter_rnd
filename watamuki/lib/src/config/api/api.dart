import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:watamuki/src/core/utils/json_serializable_converter.dart';
import 'package:watamuki/src/data/data_sources/remote/user_service.dart';

import 'interceptors.dart';

late final ChopperClient kAPI;

class Api {
  Api({required String baseUrl, required JsonSerializableConverter converter}) {
    kAPI = ChopperClient(
      baseUrl: baseUrl,
      // bind your object factories here
      converter: converter,
      errorConverter: converter,
      services: [
        UserService.create(),
      ],
      interceptors: [
        const HeadersInterceptor({
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        AuthInterceptors(),
      ],
    );
  }
}
