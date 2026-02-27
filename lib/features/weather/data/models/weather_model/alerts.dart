import 'dart:convert';

import 'package:equatable/equatable.dart';

class Alerts extends Equatable {
  final List<dynamic>? alert;

  const Alerts({this.alert});

  factory Alerts.fromMap(Map<String, dynamic> data) => Alerts(
        alert: data['alert'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'alert': alert,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Alerts].
  factory Alerts.fromJson(String data) {
    return Alerts.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Alerts] to a JSON string.
  String toJson() => json.encode(toMap());

  Alerts copyWith({
    List<dynamic>? alert,
  }) {
    return Alerts(
      alert: alert ?? this.alert,
    );
  }

  @override
  List<Object?> get props => [alert];
}
