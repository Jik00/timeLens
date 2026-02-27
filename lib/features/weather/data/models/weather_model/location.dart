import 'dart:convert';

import 'package:equatable/equatable.dart';

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


  /// Parses the string and returns the resulting Json object as [Location].
  factory Location.fromJson(String data) {
    return Location.fromMap(json.decode(data) as Map<String, dynamic>);
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
