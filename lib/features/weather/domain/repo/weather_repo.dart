import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/weather/domain/entities/location_entity.dart';
import 'package:timelens/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepo {
  Future<Either<Failure, List<WeatherEntity>>> getWeatherDetails(
      String cityName);

  Future<Either<Failure, List<LocationEntity>>> searchLocation(String cityName);
}
