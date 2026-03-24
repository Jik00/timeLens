import 'package:equatable/equatable.dart';
import 'package:timelens/core/helper_functions/trim_1st_2_words.dart';
import 'package:timelens/features/weather/domain/entities/weather_entity.dart';

import 'alerts.dart';
import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class WeatherModel extends Equatable {
  final Location location;
  final Current current;
  final Forecast forecast;
  final Alerts? alerts;

  const WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
    this.alerts,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> data) => WeatherModel(
        location: Location.fromMap(data['location'] as Map<String, dynamic>),
        current: Current.fromMap(data['current'] as Map<String, dynamic>),
        forecast: Forecast.fromMap(data['forecast'] as Map<String, dynamic>),
        alerts: data['alerts'] == null
            ? null
            : Alerts.fromMap(data['alerts'] as Map<String, dynamic>),
      );

  WeatherEntity toWeatherEntity() {
    return WeatherEntity(
      locationName: location.name,
      country: location.country,
      temperatureCelsius: current.tempC.toInt().toString(),
      conditionText: smartTrimMax18(current.condition.text, maxLength: 15),
      iconUrl: current.condition.icon,
      windmph: current.windMph,
      humidity: current.humidity,
      uvIndex: current.uv,
      maxTemp: forecast.forecastday.first.day.maxtempC.toInt().toString(),
      minTemp: forecast.forecastday.first.day.mintempC.toInt().toString(),
    );
  }

  @override
  List<Object?> get props => [location, current, forecast, alerts];
}
