import 'package:equatable/equatable.dart';

import 'forecastday.dart';

class Forecast extends Equatable {
  final List<Forecastday> forecastday;

  const Forecast({required this.forecastday});

  factory Forecast.fromMap(Map<String, dynamic> data) => Forecast(
        forecastday: (data['forecastday'] as List<dynamic>)
            .map((e) => Forecastday.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'forecastday': forecastday.map((e) => e.toMap()).toList(),
      };

  @override
  List<Object?> get props => [forecastday];
}
