import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  static const String routeName = 'chatbot_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        Text(
          context.loc.thoth,
          style: TextStyle(
            fontSize: 23.sp,
            fontWeight: FontWeight.bold,
            
          ),
        ),
      ),
      extendBodyBehindAppBar: true,

    );
  }
}
