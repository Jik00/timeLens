import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';
import 'package:timelens/features/chatbot/presentation/cubits/chatting_cubit/chatting_cubit.dart';
import 'package:timelens/features/chatbot/presentation/cubits/get_mssgs_cubit/get_mssgs_cubit.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/chat_bubble.dart';

class StreamMssgs extends StatefulWidget {
  const StreamMssgs({super.key, required this.mssgs});

  final List<MssgEntity> mssgs;

  @override
  State<StreamMssgs> createState() => _StreamMssgsState();
}

class _StreamMssgsState extends State<StreamMssgs>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetMssgsCubit, GetMssgsState>(
      listener: (context, state) {
        scrollToBottom();
      },
      child: Column(
        children: [
          Expanded(
            child: BlocListener<ChattingCubit, ChattingState>(
              listener: (context, state) {
                scrollToBottom();
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: widget.mssgs.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: ChatBubble(mssg: widget.mssgs[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
