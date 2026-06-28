import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/features/chatbot/domain/entities/chat_entity.dart';

class ChatsHistory extends StatelessWidget {
  const ChatsHistory({super.key, required this.chats});

  final List<ChatEntity> chats;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 4.h, left: 16.w, right: 16.w),
        itemCount: chats.length,
        separatorBuilder: (context, index) => Divider(
          color: AppColors.primaryColor.withAlpha(150),
          thickness: 1.5.w,
          indent: 20.w,
          endIndent: 20.w,
        ),
        itemBuilder: (context, index) => Center(
          child: Text(
            maxLines: 1,
            chats[index].title,
            style: TextStyle(
              color: AppColors.brownWriting,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
