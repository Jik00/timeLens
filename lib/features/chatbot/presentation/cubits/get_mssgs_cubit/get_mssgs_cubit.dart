import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';

part 'get_mssgs_state.dart';

class GetMssgsCubit extends Cubit<GetMssgsState> {
  GetMssgsCubit({required this.chatRepo}) : super(GetMssgsInitial());

  final ChatRepo chatRepo;
  StreamSubscription? _subscription;
  String? _currentChatId;

  Future<void> getMssgs({required String chatId}) async {
    // Cancel any existing subscription before creating a new one
    await _cancelSubscription();

    _currentChatId = chatId;
    emit(GetMssgsLoading());

      // our main fetch function
    var result = await chatRepo.getMessages(chatId);
    debugPrint("result: ${result.toString()}");

    result.fold(
      (failure) => emit(GetMssgsFailure(message: failure.message)),
      (mssgs) {
        emit(GetMssgsSuccess(mssgs: mssgs));
        // After fetching messages, subscribe to real-time updates
        _subscribeToMessagesStream(chatId);
      },
    );
  }

  void _subscribeToMessagesStream(String chatId) {
    // Cancel any existing subscription
    _subscription?.cancel();

    _subscription = chatRepo.messagesStream(chatId).listen(
      (updatedMessages) {
        if (!isClosed && _currentChatId == chatId) {
          // Update the state with new messages
          emit(GetMssgsSuccess(mssgs: updatedMessages));
        }
      },
      onError: (error) {
        if (!isClosed && _currentChatId == chatId) {
          emit(GetMssgsFailure(message: error.toString()));
        }
      },
    );
  }

  Future<void> _cancelSubscription() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  @override
  Future<void> close() {
    _cancelSubscription();
    return super.close();
  }

  // // Optional: Method to refresh messages manually
  // Future<void> refreshMessages() async {
  //   if (_currentChatId != null) {
  //     await getMssgs(chatId: _currentChatId!);
  //   }
  // }
}
