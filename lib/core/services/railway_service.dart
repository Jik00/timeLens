import 'package:dio/dio.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/enums/railway_mssg.dart';

class RailwayService {
  static const String _railwayBaseUrl =
      kRailwayBaseUrl;

  final Dio _dio;

  RailwayService(this._dio);

  Future<bool> setMessage(RailwayMessage message) async {
    try {
      final response = await _dio.post(
        '$_railwayBaseUrl$kRailwayEndpoint',
        data: {'message': message.name},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      return response.data['success'] == true;
    } on DioException catch (e) {
      throw Exception('Failed to send message: ${e.message}');
    }
  }
}