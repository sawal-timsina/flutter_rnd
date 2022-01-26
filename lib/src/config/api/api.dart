import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:watamuki/src/config/api/interceptors.dart';

late final Dio dio;

class InitDio {
  call() {
    dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env["API_URL"].toString(),
      ),
    )..interceptors.add(DioAuthInterceptors());
  }
}
