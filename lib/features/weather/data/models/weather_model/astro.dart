import 'package:equatable/equatable.dart';

class Astro extends Equatable {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final int? moonIllumination;
  final int? isMoonUp;
  final int? isSunUp;

  const Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromMap(Map<String, dynamic> data) => Astro(
        sunrise: data['sunrise'] as String?,
        sunset: data['sunset'] as String?,
        moonrise: data['moonrise'] as String?,
        moonset: data['moonset'] as String?,
        moonPhase: data['moon_phase'] as String?,
        moonIllumination: data['moon_illumination'] as int?,
        isMoonUp: data['is_moon_up'] as int?,
        isSunUp: data['is_sun_up'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'moon_illumination': moonIllumination,
        'is_moon_up': isMoonUp,
        'is_sun_up': isSunUp,
      };

  @override
  List<Object?> get props {
    return [
      sunrise,
      sunset,
      moonrise,
      moonset,
      moonPhase,
      moonIllumination,
      isMoonUp,
      isSunUp,
    ];
  }
}
