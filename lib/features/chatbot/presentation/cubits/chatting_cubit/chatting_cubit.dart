import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';

part 'chatting_state.dart';

class ChattingCubit extends Cubit<ChattingState> {
  ChattingCubit({required this.chatRepo}) : super(ChattingInitial());

  final ChatRepo chatRepo;

  final List<MssgEntity> _mssgs = [];

  Future<void> addMssg({required String mssg, required String chatId, required String userId}) async {
    final userMssg = MssgEntity(content: mssg, role: kUser, chatId: chatId, userId: userId);

    _mssgs.add(userMssg);

    final typing = MssgEntity(
      content: kTyping,
      role: kAssistant,
      chatId: chatId,
      userId: userId,
    );

    emit(ChattingLoading(
      mssgs: [..._mssgs, typing],
    ));

    final result = await chatRepo.exchangeMessage(chatId, mssg, userId);

    result.fold(
      (failure) {
        emit(ChattingFailure(
          mssgs: List.from(_mssgs),
          error: failure.toString(),
        ));
      },
      (reply) {
        _mssgs.add(reply);

        emit(ChattingSuccess(
          mssgs: List.from(_mssgs),
        ));
      },
    );
  }
}
