import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/weather/data/models/weather_model/location.dart';
import 'package:timelens/features/weather/data/models/weather_model/weather_model.dart';
import 'package:timelens/features/weather/domain/entities/location_weather_entity.dart';
import 'package:timelens/features/weather/domain/entities/weather_entity.dart';
import 'package:timelens/features/weather/domain/repo/weather_repo.dart';

import '../../../../core/services/weather_api_service.dart';

class WeatherRepoImpl implements WeatherRepo {
  final WeatherApiService apiService;
  WeatherRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherDetails(
      String cityName) async {
    try {
      log("Getting weather details for city: $cityName");

      final response = await apiService.getWeatherDetails(cityName);

      final weatherModel = WeatherModel.fromJson(response.data);

      return Right(weatherModel.toWeatherDetailsEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LocationWeatherEntity>> searchLocation(
      String cityName) async {
    try {
      log("Searching location for city: $cityName");

      final response = await apiService.searchLocation(cityName);

      final locationmodel = Location.fromJson(response.data[0]);

      return Right(locationmodel.toSearchLocationWeatherEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}