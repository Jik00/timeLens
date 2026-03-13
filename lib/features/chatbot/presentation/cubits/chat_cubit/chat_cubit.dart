import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.chatRepo}) : super(ChatInitial());

  final ChatRepo chatRepo;

  Future<void> exchangeMssg(
      {required String chatId, required String mssg}) async {
    
    emit(ChatLoading());

    var result = await chatRepo.exchangeMessage(chatId, mssg);

    result.fold(
      (failure) => emit(ChatFailure(message: failure.message)),
      (reply) => emit(ChatSuccess(reply: reply)),
    );
  }
}
