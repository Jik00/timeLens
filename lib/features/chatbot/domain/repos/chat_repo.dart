import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/chatbot/domain/entities/chat_entity.dart';
import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';

abstract class ChatRepo {

  Future<Either<Failure, MssgEntity>> exchangeMessage(String chatId, String message, String userId);

  Future <Either <Failure, List<MssgEntity>>> getMessages(String chatId, String userId);

  Future<Either<Failure, List<ChatEntity>>> getChats(String userId, {bool forceRefresh = false});
  
  void clearCache();

 // Stream<List<MssgEntity>> messagesStream(String chatId);

}