import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/widgets/custom_error_widget.dart';
import 'package:timelens/features/chatbot/presentation/cubits/chatting_cubit/chatting_cubit.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/default_chat_body.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/stream_mssgs.dart';

class ChatBodyBlocBuilder extends StatefulWidget {
  const ChatBodyBlocBuilder({super.key});

  @override
  State<ChatBodyBlocBuilder> createState() => _ChatBodyBlocBuilderState();
}

final ScrollController scrollController = ScrollController();

class _ChatBodyBlocBuilderState extends State<ChatBodyBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChattingCubit, ChattingState>(
      builder: (context, state) {
        if (state is ChattingSuccess || state is ChattingLoading) {
          return StreamMssgs(mssgs: state.mssgs);
        } else if (state is ChattingFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CustomErrorWidget(message: state.error),
            ),
          );
        } else {
          return const DefaultChatBody();
        }
      },
    );
  }
}
