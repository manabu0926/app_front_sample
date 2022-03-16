import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:openapi/openapi.dart';

class OpenApiFactory {
  OpenApiFactory();

  Openapi build() {
    const flavor = String.fromEnvironment('FLAVOR');
    final String baseUrl;
    bool isAndroid = Platform.isAndroid;
    if (flavor == 'prod') {
      baseUrl = 'http://10.0.2.2:3000';
    } else if (flavor == 'stg') {
      baseUrl = isAndroid ? 'http://10.0.2.2:8082' : 'http://localhost:8082';
    } else {
      baseUrl = isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';
    }
    return Openapi(
      basePathOverride: baseUrl,
      interceptors: [
        if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true),
      ],
    );
  }
}
