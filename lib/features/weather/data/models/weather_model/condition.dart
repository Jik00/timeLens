import 'package:equatable/equatable.dart';

class Condition extends Equatable {
  final String text;
  final String icon;
  final int? code;

  const Condition({ required this.text, required this.icon, this.code});

  factory Condition.fromMap(Map<String, dynamic> data) => Condition(
        text: data['text'] as String,
        icon: data['icon'] as String,
        code: data['code'] as int,
      );

  Map<String, dynamic> toMap() => {
        'text': text,
        'icon': icon,
        'code': code,
      };

  @override
  List<Object?> get props => [text, icon];
}
