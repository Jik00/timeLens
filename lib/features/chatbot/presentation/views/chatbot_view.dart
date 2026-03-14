import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';
import 'package:timelens/features/chatbot/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:timelens/features/chatbot/presentation/cubits/get_mssgs_cubit/get_mssgs_cubit.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/app_bar_body.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/chatbot_view_body.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  static const String routeName = 'chatbot_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatCubit>(
          create: (context) => ChatCubit(chatRepo: getIt.get<ChatRepo>()),
        ),
        BlocProvider<GetMssgsCubit>(
          create: (context) => GetMssgsCubit(chatRepo: getIt.get<ChatRepo>()),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: buildAppBar(
          AppBarBody(),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: ChatbotViewBody(),
      ),
    );
  }
}
