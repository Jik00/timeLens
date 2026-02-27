import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/weather/domain/entities/search_location_weather_entity.dart';
import 'package:timelens/features/weather/domain/entities/weather_details_entity.dart';
import 'package:timelens/features/weather/domain/repo/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo{
  @override
  Future<Either<Failure, WeatherDetailsEntity>> getWeatherDetails(String cityName) {
    // TODO: implement getWeatherDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SearchLocationWeatherEntity>> searchLocation(String cityName) {
    // TODO: implement searchLocation
    throw UnimplementedError();
  }
}