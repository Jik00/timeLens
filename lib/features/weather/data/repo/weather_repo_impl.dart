import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/weather/data/models/weather_model/location.dart';
import 'package:timelens/features/weather/data/models/weather_model/weather_model.dart';
import 'package:timelens/features/weather/domain/entities/location_entity.dart';
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

      final response = await apiService.getWeatherDetails(cityName);

      final WeatherModel weatherModel = WeatherModel.fromMap(response.data);

      return Right(weatherModel.toWeatherEntity());

    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> searchLocation(
      String cityName) async {
    try {

      final response = await apiService.searchLocation(cityName);

      log("Raw response: ${response.data}");

      final List <Location> locationModels = (response.data as List)
          .map((locationJson) => Location.fromMap(locationJson))
          .toList();

      final List<LocationEntity> locationEntities =
          locationModels.map((model) => model.toLocationEntity()).toList();

      return Right(locationEntities);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
