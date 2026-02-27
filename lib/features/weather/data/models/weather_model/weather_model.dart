import 'dart:convert';

import 'package:equatable/equatable.dart';
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

  /// Parses the string and returns the resulting Json object as [WeatherModel].
  factory WeatherModel.fromJson(String data) {
    return WeatherModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  WeatherEntity toWeatherDetailsEntity() {
    return WeatherEntity(
      locationName: location.name,
      country: location.country,
      temperatureCelsius: current.tempC,
      conditionText: current.condition.text,
      iconUrl: current.condition.icon,
      windKph: current.windKph,
      humidity: current.humidity,
      uvIndex: current.uv,
      maxTemp: forecast.forecastday.first.day.maxtempC.toString(),
      minTemp: forecast.forecastday.first.day.mintempC.toString(),
    );
  }

  WeatherModel copyWith({
    Location? location,
    Current? current,
    Forecast? forecast,
    Alerts? alerts,
  }) {
    return WeatherModel(
      location: location ?? this.location,
      current: current ?? this.current,
      forecast: forecast ?? this.forecast,
      alerts: alerts ?? this.alerts,
    );
  }

  @override
  List<Object?> get props => [location, current, forecast, alerts];
}
