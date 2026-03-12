import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  @override
  Future<MssgEntity> exchangeMessage(String chatId, String message) {
    // TODO: implement exchangeMessage
    throw UnimplementedError();
  }
}