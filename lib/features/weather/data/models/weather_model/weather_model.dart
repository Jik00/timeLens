import 'dart:convert';

import 'package:equatable/equatable.dart';

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

  Map<String, dynamic> toMap() => {
        'location': location.toMap(),
        'current': current.toMap(),
        'forecast': forecast.toMap(),
        'alerts': alerts?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WeatherModel].
  factory WeatherModel.fromJson(String data) {
    return WeatherModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WeatherModel] to a JSON string.
  String toJson() => json.encode(toMap());

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
