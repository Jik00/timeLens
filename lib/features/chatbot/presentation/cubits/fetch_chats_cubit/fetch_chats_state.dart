part of 'fetch_chats_cubit.dart';

sealed class FetchChatsState extends Equatable {
  const FetchChatsState({this.chats = const []});

  final List<ChatEntity> chats;

  @override
  List<Object> get props => [chats];
}

final class FetchChatsInitial extends FetchChatsState {
  const FetchChatsInitial() : super(chats: const []);
}

final class FetchChatsLoading extends FetchChatsState {
  const FetchChatsLoading({super.chats});
}

final class FetchChatsSuccess extends FetchChatsState {
  const FetchChatsSuccess({required super.chats});
}

final class FetchChatsFailure extends FetchChatsState {
  const FetchChatsFailure({required this.message, super.chats});

  final String message;

  @override
  List<Object> get props => [chats, message];
}