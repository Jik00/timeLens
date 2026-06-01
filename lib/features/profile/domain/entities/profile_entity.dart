import 'package:hive_flutter/adapters.dart';

part 'profile_entity.g.dart';


@HiveType(typeId: 0)
class ProfileEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String avatarUrl;
  @HiveField(4)
  final String language;

  ProfileEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.avatarUrl,
    required this.language,
  });

  factory ProfileEntity.fromMap(Map<String, dynamic> data) {
    return ProfileEntity(
      id: data['id'] ?? '',
      email: data['email'] ?? '',
      name: data['full_name'] ?? '',
      avatarUrl: data['avatar_url'] ?? '',
      language: data['language'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'full_name': name,
      'avatar_url': avatarUrl,
      'language': language,
    };
  }

  ProfileEntity copyWith({
    final String? id,
    final String? email,
    final String? name,
    final String? avatarUrl,
    final String? language,
  }) {
    return ProfileEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      language: language ?? this.language,
    );
  }
}
