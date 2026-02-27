import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'condition.dart';

class Hour extends Equatable {
  final int? timeEpoch;
  final String? time;
  final double? tempC;
  final double? tempF;
  final int? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final int? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final int? snowCm;
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? windchillC;
  final double? windchillF;
  final double? heatindexC;
  final double? heatindexF;
  final double? dewpointC;
  final double? dewpointF;
  final int? willItRain;
  final int? chanceOfRain;
  final int? willItSnow;
  final int? chanceOfSnow;
  final int? visKm;
  final int? visMiles;
  final double? gustMph;
  final double? gustKph;
  final double? uv;
  final int? shortRad;
  final int? diffRad;
  final int? dni;
  final int? gti;

  const Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.snowCm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
    this.shortRad,
    this.diffRad,
    this.dni,
    this.gti,
  });

  factory Hour.fromMap(Map<String, dynamic> data) => Hour(
        timeEpoch: data['time_epoch'] as int?,
        time: data['time'] as String?,
        tempC: (data['temp_c'] as num?)?.toDouble(),
        tempF: (data['temp_f'] as num?)?.toDouble(),
        isDay: data['is_day'] as int?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
        windMph: (data['wind_mph'] as num?)?.toDouble(),
        windKph: (data['wind_kph'] as num?)?.toDouble(),
        windDegree: data['wind_degree'] as int?,
        windDir: data['wind_dir'] as String?,
        pressureMb: data['pressure_mb'] as int?,
        pressureIn: (data['pressure_in'] as num?)?.toDouble(),
        precipMm: (data['precip_mm'] as num?)?.toDouble(),
        precipIn: (data['precip_in'] as num?)?.toDouble(),
        snowCm: data['snow_cm'] as int?,
        humidity: data['humidity'] as int?,
        cloud: data['cloud'] as int?,
        feelslikeC: (data['feelslike_c'] as num?)?.toDouble(),
        feelslikeF: (data['feelslike_f'] as num?)?.toDouble(),
        windchillC: (data['windchill_c'] as num?)?.toDouble(),
        windchillF: (data['windchill_f'] as num?)?.toDouble(),
        heatindexC: (data['heatindex_c'] as num?)?.toDouble(),
        heatindexF: (data['heatindex_f'] as num?)?.toDouble(),
        dewpointC: (data['dewpoint_c'] as num?)?.toDouble(),
        dewpointF: (data['dewpoint_f'] as num?)?.toDouble(),
        willItRain: data['will_it_rain'] as int?,
        chanceOfRain: data['chance_of_rain'] as int?,
        willItSnow: data['will_it_snow'] as int?,
        chanceOfSnow: data['chance_of_snow'] as int?,
        visKm: data['vis_km'] as int?,
        visMiles: data['vis_miles'] as int?,
        gustMph: (data['gust_mph'] as num?)?.toDouble(),
        gustKph: (data['gust_kph'] as num?)?.toDouble(),
        uv: (data['uv'] as num?)?.toDouble(),
        shortRad: data['short_rad'] as int?,
        diffRad: data['diff_rad'] as int?,
        dni: data['dni'] as int?,
        gti: data['gti'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'time_epoch': timeEpoch,
        'time': time,
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
        'snow_cm': snowCm,
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
        'will_it_rain': willItRain,
        'chance_of_rain': chanceOfRain,
        'will_it_snow': willItSnow,
        'chance_of_snow': chanceOfSnow,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
        'uv': uv,
        'short_rad': shortRad,
        'diff_rad': diffRad,
        'dni': dni,
        'gti': gti,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Hour].
  factory Hour.fromJson(String data) {
    return Hour.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Hour] to a JSON string.
  String toJson() => json.encode(toMap());

  Hour copyWith({
    int? timeEpoch,
    String? time,
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
    int? snowCm,
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
    int? willItRain,
    int? chanceOfRain,
    int? willItSnow,
    int? chanceOfSnow,
    int? visKm,
    int? visMiles,
    double? gustMph,
    double? gustKph,
    double? uv,
    int? shortRad,
    int? diffRad,
    int? dni,
    int? gti,
  }) {
    return Hour(
      timeEpoch: timeEpoch ?? this.timeEpoch,
      time: time ?? this.time,
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
      snowCm: snowCm ?? this.snowCm,
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
      willItRain: willItRain ?? this.willItRain,
      chanceOfRain: chanceOfRain ?? this.chanceOfRain,
      willItSnow: willItSnow ?? this.willItSnow,
      chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
      visKm: visKm ?? this.visKm,
      visMiles: visMiles ?? this.visMiles,
      gustMph: gustMph ?? this.gustMph,
      gustKph: gustKph ?? this.gustKph,
      uv: uv ?? this.uv,
      shortRad: shortRad ?? this.shortRad,
      diffRad: diffRad ?? this.diffRad,
      dni: dni ?? this.dni,
      gti: gti ?? this.gti,
    );
  }

  @override
  List<Object?> get props {
    return [
      timeEpoch,
      time,
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
      snowCm,
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
      willItRain,
      chanceOfRain,
      willItSnow,
      chanceOfSnow,
      visKm,
      visMiles,
      gustMph,
      gustKph,
      uv,
      shortRad,
      diffRad,
      dni,
      gti,
    ];
  }
}
