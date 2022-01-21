import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:watamuki/src/config/firebase/auth.dart';

class AuthInterceptors extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    String? token = await firebaseAuth.currentUser?.getIdToken();
    if (token != null) {
      request.headers
          .addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
    }
    return request;
  }
}
