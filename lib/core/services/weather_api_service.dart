import 'package:dio/dio.dart';
import 'package:timelens/constants.dart';

class WeatherApiService {
  final Dio dio;

  WeatherApiService({required this.dio});

  Future<Response> getWeatherDetails(String city) {
    return dio.get(
      kWeatherEndpoint,
      queryParameters: {
        'q': city,
        'days': 1,
        'alerts': 'yes',
      },
    );
  }

  Future<Response> searchLocation(String city) {
    return dio.get(
      kSearchWeatherEndpoint,
      queryParameters: {
        'q': city,
      },
    );
  }

}