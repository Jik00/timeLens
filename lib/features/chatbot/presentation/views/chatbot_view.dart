import 'package:flutter/material.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/app_bar_body.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/chatbot_view_body.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  static const String routeName = 'chatbot_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(
        AppBarBody(),
      ),
      extendBodyBehindAppBar: true,
      body: ChatbotViewBody(),
    );
  }
}
