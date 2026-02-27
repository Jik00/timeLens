import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/weather/domain/entities/search_location_weather_entity.dart';
import 'package:timelens/features/weather/domain/entities/weather_details_entity.dart';

abstract class WeatherRepo {

  Future<Either<Failure, WeatherDetailsEntity>> getWeatherDetails( String cityName);

  Future<Either<Failure, SearchLocationWeatherEntity>> searchLocation( String cityName);

}