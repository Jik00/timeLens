import 'package:equatable/equatable.dart';

import 'condition.dart';

class Day extends Equatable {
  final int maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final int avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final int totalsnowCm;
  final int avgvisKm;
  final int avgvisMiles;
  final int avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;
  final double uv;

  const Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromMap(Map<String, dynamic> data) => Day(
        maxtempC: (data['maxtemp_c'] as num).toInt(),
        maxtempF: (data['maxtemp_f'] as num).toDouble(),
        mintempC: (data['mintemp_c'] as num).toDouble(),
        mintempF: (data['mintemp_f'] as num).toDouble(),
        avgtempC: (data['avgtemp_c'] as num).toInt(),
        avgtempF: (data['avgtemp_f'] as num).toDouble(),
        maxwindMph: (data['maxwind_mph'] as num).toDouble(),
        maxwindKph: (data['maxwind_kph'] as num).toDouble(),
        totalprecipMm: (data['totalprecip_mm'] as num).toDouble(),
        totalprecipIn: (data['totalprecip_in'] as num).toDouble(),
        totalsnowCm: (data['totalsnow_cm'] as num).toInt(),
        avgvisKm: (data['avgvis_km'] as num).toInt(),
        avgvisMiles: (data['avgvis_miles'] as num).toInt(),
        avghumidity: (data['avghumidity'] as num).toInt(),
        dailyWillItRain: (data['daily_will_it_rain'] as num).toInt(),
        dailyChanceOfRain: (data['daily_chance_of_rain'] as num).toInt(),
        dailyWillItSnow: (data['daily_will_it_snow'] as num).toInt(),
        dailyChanceOfSnow: (data['daily_chance_of_snow'] as num).toInt(),
        condition: Condition.fromMap(data['condition'] as Map<String, dynamic>),
        uv: (data['uv'] as num).toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'maxtemp_c': maxtempC,
        'maxtemp_f': maxtempF,
        'mintemp_c': mintempC,
        'mintemp_f': mintempF,
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'maxwind_mph': maxwindMph,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalprecip_in': totalprecipIn,
        'totalsnow_cm': totalsnowCm,
        'avgvis_km': avgvisKm,
        'avgvis_miles': avgvisMiles,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition.toMap(),
        'uv': uv,
      };

  @override
  List<Object?> get props {
    return [
      maxtempC,
      maxtempF,
      mintempC,
      mintempF,
      avgtempC,
      avgtempF,
      maxwindMph,
      maxwindKph,
      totalprecipMm,
      totalprecipIn,
      totalsnowCm,
      avgvisKm,
      avgvisMiles,
      avghumidity,
      dailyWillItRain,
      dailyChanceOfRain,
      dailyWillItSnow,
      dailyChanceOfSnow,
      condition,
      uv,
    ];
  }
}
