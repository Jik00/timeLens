import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';

abstract class ChatRepo {

  Future<Either<Failure, MssgEntity>> exchangeMessage(String chatId, String message);

  Future <Either <Failure, List<MssgEntity>>> getMessages(String chatId);

  Stream<List<MssgEntity>> messagesStream(String chatId);

}