import 'package:dio/dio.dart';

import '../config.dart';
import 'interceptors.dart';

late final Dio dio;

class InitDio {
  call() {
    dio = Dio(
      BaseOptions(
        baseUrl: Config.apiUrl,
      ),
    )..interceptors.add(DioAuthInterceptors());
  }
}
