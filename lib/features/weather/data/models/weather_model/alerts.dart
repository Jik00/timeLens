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

  @override
  List<Object?> get props => [alert];
}
