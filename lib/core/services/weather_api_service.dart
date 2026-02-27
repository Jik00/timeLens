import 'dart:developer';

import 'package:dio/dio.dart';

class WeatherApiService {
  final Dio dio;

  WeatherApiService({required this.dio});

  Future <Response> getData (String endPoint, Map<String, dynamic>? queryParameters) async {
    try {
      
      log('Fetching weather data from endpoint: $endPoint with query parameters: $queryParameters');
      final response = await dio.get(endPoint, queryParameters: queryParameters);

      return response;
    } catch (e) {
      rethrow;
    }
  }

}