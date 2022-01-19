import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:watamuki/src/config/api/interceptors.dart';
import 'package:watamuki/src/config/api/json_converters.dart';
import 'package:watamuki/src/core/utils/json_serializable_converter.dart';
import 'package:watamuki/src/data/data_sources/remote/index.dart';

late final Api kAPI;

class InitApi {
  call() {
    kAPI = Api(
      jsonConverter: JsonConverters()(),
      services: Services()(),
    );
  }
}

class Api extends ChopperClient {
  Api({
    required JsonSerializableConverter jsonConverter,
    Iterable<ChopperService> services = const [],
  }) : super(
          baseUrl: dotenv.env["API_URL"].toString(),
          converter: jsonConverter,
          errorConverter: jsonConverter,
          services: services,
          interceptors: [
            const HeadersInterceptor({
              HttpHeaders.contentTypeHeader: "application/json",
            }),
            AuthInterceptors(),
          ],
        );
}
