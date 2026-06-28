import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/features/chatbot/domain/entities/chat_entity.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';

part 'fetch_chats_state.dart';

class FetchChatsCubit extends Cubit<FetchChatsState> {
  FetchChatsCubit({required this.chatRepo}) : super(const FetchChatsInitial());

  final ChatRepo chatRepo;

  Future<void> getChats(String userId, {bool forceRefresh = false}) async {
    if (state is FetchChatsLoading) return;


    emit(FetchChatsLoading(chats: state.chats));

    final result = await chatRepo.getChats(userId, forceRefresh: forceRefresh);

    if (isClosed) return;

    result.fold(
      (failure) => emit(FetchChatsFailure(message: failure.message, chats: state.chats)),
      (chats) => emit(FetchChatsSuccess(chats: chats)),
    );
  }
}