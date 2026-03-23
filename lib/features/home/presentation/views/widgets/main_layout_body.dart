import 'package:flutter/material.dart';
import 'package:timelens/features/chatbot/presentation/views/chatbot_view.dart';
import 'package:timelens/features/home/presentation/views/home_view.dart';

class MainLayoutBody extends StatefulWidget {
  const MainLayoutBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;
  @override
  State<MainLayoutBody> createState() => _MainLayoutBodyState();
}

class _MainLayoutBodyState extends State<MainLayoutBody> {
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.currentViewIndex,
      children: const[
        HomeView(),
        ChatbotView(),
        //ProfileView(),
        //WebView(),
      ],
    );
  }
}
