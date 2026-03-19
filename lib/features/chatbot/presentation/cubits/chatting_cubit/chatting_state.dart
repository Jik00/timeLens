part of 'chatting_cubit.dart';

abstract class ChattingState {
  final List<MssgEntity> mssgs;

  const ChattingState({required this.mssgs});
}

class ChattingInitial extends ChattingState {
  ChattingInitial() : super(mssgs: []);
}

class ChattingLoading extends ChattingState {
  const ChattingLoading({required super.mssgs});
}

class ChattingSuccess extends ChattingState {
  const ChattingSuccess({required super.mssgs});
}

class ChattingFailure extends ChattingState {
  final String error;

  const ChattingFailure({
    required super.mssgs,
    required this.error,
  });
}
