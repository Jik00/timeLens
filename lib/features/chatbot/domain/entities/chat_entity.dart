class ChatEntity {
  final int id;
  final String title;

  ChatEntity({required this.id, required this.title});

  factory ChatEntity.fromMap(Map<String, dynamic> map) {
    return ChatEntity(id: map['id'], title: map['title']);
  }
}
