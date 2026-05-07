
class ProfileEntity {
  final String id;
  final String email;
  final String name;
  final String avatarUrl;

  ProfileEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.avatarUrl,
  });

  factory ProfileEntity.fromMap(Map<String, dynamic> data) {
    return ProfileEntity(
      id: data['id'] ?? '',
      email: data['email'] ?? '',
      name: data['full_name'] ?? '',
      avatarUrl: data['avatar_url'] ?? '',
    );
  }
}
