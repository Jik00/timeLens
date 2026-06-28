import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/features/auth/presentation/cubits/auth_controller/auth_controller.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';
import 'package:timelens/features/chatbot/presentation/cubits/fetch_chats_cubit/fetch_chats_cubit.dart';
import 'package:timelens/features/chatbot/presentation/cubits/get_mssgs_cubit/get_mssgs_cubit.dart';
import 'package:timelens/features/chatbot/presentation/cubits/chatting_cubit/chatting_cubit.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/chat_drawer.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/chatbot_view_body.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  static const String routeName = 'chatbot_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChattingCubit>(
          create: (context) => ChattingCubit(chatRepo: getIt.get<ChatRepo>()),
        ),
        BlocProvider<GetMssgsCubit>(
          create: (context) => GetMssgsCubit(chatRepo: getIt.get<ChatRepo>()),
        ),
        BlocProvider<FetchChatsCubit>(
          create: (context) => FetchChatsCubit(chatRepo: getIt.get<ChatRepo>())..getChats(context.read<AuthController>().userId ?? 'testUserId'),
        ),
      ],
      child: Scaffold(
        endDrawer: const ChatDrawer(),
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: const ChatbotViewBody(),
      ),
    );
  }
}
