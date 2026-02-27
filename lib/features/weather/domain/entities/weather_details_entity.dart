class WeatherDetailsEntity {
  final String locationName;
  final String country;
  final double temperatureCelsius;
  final String conditionText;
  final String iconUrl;
  final double windKph;
  final int humidity;
  final double uvIndex;
  final String maxTemp;
  final String minTemp;

  WeatherDetailsEntity({
    required this.locationName,
    required this.country,
    required this.temperatureCelsius,
    required this.conditionText,
    required this.iconUrl,
    required this.windKph,
    required this.humidity,
    required this.uvIndex,
    required this.maxTemp,
    required this.minTemp,
  });
}
