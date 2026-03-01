import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:timelens/features/weather/domain/entities/location_entity.dart';

class Location extends Equatable {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromMap(Map<String, dynamic> data) => Location(
        name: data['name'] as String,
        region: data['region'] as String,
        country: data['country'] as String,
        lat: (data['lat'] as num?)?.toDouble() ?? 0.0,
        lon: (data['lon'] as num?)?.toDouble() ?? 0.0,
        tzId: data['tz_id'] as String?,
        localtimeEpoch: data['localtime_epoch'] as int?,
        localtime: data['localtime'] as String?,
      );

  LocationEntity toLocationEntity() {
    return LocationEntity(
      locationName: name,
      region: region,
      country: country,
      lat: lat.toString(),
      lon: lon.toString(),
    );
  }

  Location copyWith({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    int? localtimeEpoch,
    String? localtime,
  }) {
    return Location(
      name: name ?? this.name,
      region: region ?? this.region,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      tzId: tzId ?? this.tzId,
      localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
      localtime: localtime ?? this.localtime,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      region,
      country,
      lat,
      lon,
    ];
  }
}
