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

  Future<void> getMssgs({required String chatId}) async {
    emit(GetMssgsLoading());

    var result = await chatRepo.getMessages(chatId);
    debugPrint("result: ${result.toString()}");

    result.fold(
      (failure) => emit(GetMssgsFailure(message: failure.message)),
      (mssgs) {
        emit(GetMssgsSuccess(mssgs: mssgs));
      },
    );
  }
}
