import 'dart:convert';

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
  final int shortRad;
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
    required this.shortRad,
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
        pressureMb: data['pressure_mb'] as int,
        pressureIn: (data['pressure_in'] as num).toDouble(),
        precipMm: (data['precip_mm'] as num).toDouble(),
        precipIn: (data['precip_in'] as num).toDouble(),
        humidity: data['humidity'] as int,
        cloud: data['cloud'] as int,
        feelslikeC: (data['feelslike_c'] as num).toDouble(),
        feelslikeF: (data['feelslike_f'] as num).toDouble(),
        windchillC: (data['windchill_c'] as num).toDouble(),
        windchillF: (data['windchill_f'] as num).toDouble(),
        heatindexC: (data['heatindex_c'] as num).toDouble(),
        heatindexF: (data['heatindex_f'] as num).toDouble(),
        dewpointC: (data['dewpoint_c'] as num).toDouble(),
        dewpointF: (data['dewpoint_f'] as num).toDouble(),
        visKm: data['vis_km'] as int,
        visMiles: data['vis_miles'] as int,
        uv: (data['uv'] as num).toDouble(),
        gustMph: (data['gust_mph'] as num).toDouble(),
        gustKph: (data['gust_kph'] as num).toDouble(),
        shortRad: data['short_rad'] as int,
        diffRad: data['diff_rad'] as int,
        dni: data['dni'] as int,
        gti: data['gti'] as int,
      );

  Map<String, dynamic> toMap() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'last_updated': lastUpdated,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition?.toMap(),
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

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Current].
  factory Current.fromJson(String data) {
    return Current.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Current] to a JSON string.
  String toJson() => json.encode(toMap());

  Current copyWith({
    int? lastUpdatedEpoch,
    String? lastUpdated,
    double? tempC,
    double? tempF,
    int? isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    int? pressureMb,
    double? pressureIn,
    double? precipMm,
    double? precipIn,
    int? humidity,
    int? cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? windchillC,
    double? windchillF,
    double? heatindexC,
    double? heatindexF,
    double? dewpointC,
    double? dewpointF,
    int? visKm,
    int? visMiles,
    double? uv,
    double? gustMph,
    double? gustKph,
    int? shortRad,
    int? diffRad,
    int? dni,
    int? gti,
  }) {
    return Current(
      lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      tempC: tempC ?? this.tempC,
      tempF: tempF ?? this.tempF,
      isDay: isDay ?? this.isDay,
      condition: condition ?? this.condition,
      windMph: windMph ?? this.windMph,
      windKph: windKph ?? this.windKph,
      windDegree: windDegree ?? this.windDegree,
      windDir: windDir ?? this.windDir,
      pressureMb: pressureMb ?? this.pressureMb,
      pressureIn: pressureIn ?? this.pressureIn,
      precipMm: precipMm ?? this.precipMm,
      precipIn: precipIn ?? this.precipIn,
      humidity: humidity ?? this.humidity,
      cloud: cloud ?? this.cloud,
      feelslikeC: feelslikeC ?? this.feelslikeC,
      feelslikeF: feelslikeF ?? this.feelslikeF,
      windchillC: windchillC ?? this.windchillC,
      windchillF: windchillF ?? this.windchillF,
      heatindexC: heatindexC ?? this.heatindexC,
      heatindexF: heatindexF ?? this.heatindexF,
      dewpointC: dewpointC ?? this.dewpointC,
      dewpointF: dewpointF ?? this.dewpointF,
      visKm: visKm ?? this.visKm,
      visMiles: visMiles ?? this.visMiles,
      uv: uv ?? this.uv,
      gustMph: gustMph ?? this.gustMph,
      gustKph: gustKph ?? this.gustKph,
      shortRad: shortRad ?? this.shortRad,
      diffRad: diffRad ?? this.diffRad,
      dni: dni ?? this.dni,
      gti: gti ?? this.gti,
    );
  }

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
