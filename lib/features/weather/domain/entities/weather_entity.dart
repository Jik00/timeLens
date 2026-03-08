import 'package:equatable/equatable.dart';

class WeatherEntity  extends Equatable {
  final String locationName;
  final String country;
  final String temperatureCelsius;
  final String conditionText;
  final String iconUrl;
  final double windmph;
  final int humidity;
  final double uvIndex;
  final String maxTemp;
  final String minTemp;

  const WeatherEntity({
    required this.locationName,
    required this.country,
    required this.temperatureCelsius,
    required this.conditionText,
    required this.iconUrl,
    required this.windmph,
    required this.humidity,
    required this.uvIndex,
    required this.maxTemp,
    required this.minTemp,
  });
  
  @override
  List<Object?> get props => [locationName, country, temperatureCelsius, conditionText, iconUrl, windmph, humidity, uvIndex, maxTemp, minTemp];
}
