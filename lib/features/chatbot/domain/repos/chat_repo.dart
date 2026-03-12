import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';

abstract class ChatRepo {

  Future<MssgEntity> exchangeMessage(String chatId, String message);

}