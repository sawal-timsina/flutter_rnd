import 'package:dio/dio.dart';
import 'package:watamuki/src/config/api/interceptors.dart';
import 'package:watamuki/src/config/config.dart';

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
