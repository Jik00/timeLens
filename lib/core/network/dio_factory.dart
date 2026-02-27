import 'package:dio/dio.dart';
import 'package:timelens/constants.dart';

import '../services/shared_preferences_singleton.dart';

class DioFactory {
  Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: kBaseUrl,
        queryParameters: {
          'key': kApiKey,
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['lang'] = Prefs.getCurrentLanguage();
          return handler.next(options);
        },
      ),
    );

    return dio;
  }
}