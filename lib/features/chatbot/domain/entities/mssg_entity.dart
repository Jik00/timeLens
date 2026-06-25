class MssgEntity {
  final String content;
  final String role;
  final String chatId;
  final String userId;

  MssgEntity({
    required this.content,
    required this.role,
    required this.chatId,
    required this.userId,
  });

  factory MssgEntity.fromMap(Map<String, dynamic> map) {
    return MssgEntity(
      content: map['content'],
      role: map['role'],
      chatId: map['chat_id'],
      userId: map['user_id'],
    );
  }
}
