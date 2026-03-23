import 'package:equatable/equatable.dart';

import 'condition.dart';

class Current extends Equatable {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final int pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int visKm;
  final int visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;
  final int? shortRad;
  final int diffRad;
  final int dni;
  final int gti;

  const Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    this.shortRad,
    required this.diffRad,
    required this.dni,
    required this.gti,
  });

  factory Current.fromMap(Map<String, dynamic> data) => Current(
        lastUpdatedEpoch: data['last_updated_epoch'] as int,
        lastUpdated: data['last_updated'] as String,
        tempC: (data['temp_c'] as num).toDouble(),
        tempF: (data['temp_f'] as num).toDouble(),
        isDay: data['is_day'] as int,
        condition: Condition.fromMap(data['condition'] as Map<String, dynamic>),
        windMph: (data['wind_mph'] as num).toDouble(),
        windKph: (data['wind_kph'] as num).toDouble(),
        windDegree: data['wind_degree'] as int,
        windDir: data['wind_dir'] as String,
        pressureMb: (data['pressure_mb'] as num).toInt(),
        pressureIn: (data['pressure_in'] as num).toDouble(),
        precipMm: (data['precip_mm'] as num).toDouble(),
        precipIn: (data['precip_in'] as num).toDouble(),
        humidity: (data['humidity'] as num).toInt(),
        cloud: (data['cloud'] as num).toInt(),
        feelslikeC: (data['feelslike_c'] as num).toDouble(),
        feelslikeF: (data['feelslike_f'] as num).toDouble(),
        windchillC: (data['windchill_c'] as num).toDouble(),
        windchillF: (data['windchill_f'] as num).toDouble(),
        heatindexC: (data['heatindex_c'] as num).toDouble(),
        heatindexF: (data['heatindex_f'] as num).toDouble(),
        dewpointC: (data['dewpoint_c'] as num).toDouble(),
        dewpointF: (data['dewpoint_f'] as num).toDouble(),
        visKm: (  data['vis_km'] as num).toInt(),
        visMiles: (data['vis_miles'] as num ).toInt(),
        uv: (data['uv'] as num).toDouble(),
        gustMph: (data['gust_mph'] as num).toDouble(),
        gustKph: (data['gust_kph'] as num).toDouble(),
        shortRad: ( data['short_rad']) ?? 0,
        diffRad: (data['diff_rad'] as num).toInt(),
        dni: (data['dni'] as num).toInt(),
        gti: (data['gti'] as num).toInt(),
      );

  Map<String, dynamic> toMap() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'last_updated': lastUpdated,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition.toMap(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'windchill_c': windchillC,
        'windchill_f': windchillF,
        'heatindex_c': heatindexC,
        'heatindex_f': heatindexF,
        'dewpoint_c': dewpointC,
        'dewpoint_f': dewpointF,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'uv': uv,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
        'short_rad': shortRad,
        'diff_rad': diffRad,
        'dni': dni,
        'gti': gti,
      };

  @override
  List<Object?> get props {
    return [
      lastUpdatedEpoch,
      lastUpdated,
      tempC,
      tempF,
      isDay,
      condition,
      windMph,
      windKph,
      windDegree,
      windDir,
      pressureMb,
      pressureIn,
      precipMm,
      precipIn,
      humidity,
      cloud,
      feelslikeC,
      feelslikeF,
      windchillC,
      windchillF,
      heatindexC,
      heatindexF,
      dewpointC,
      dewpointF,
      visKm,
      visMiles,
      uv,
      gustMph,
      gustKph,
      shortRad,
      diffRad,
      dni,
      gti,
    ];
  }
}
