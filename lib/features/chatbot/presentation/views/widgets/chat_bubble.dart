import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.mssg});

  final MssgEntity mssg;

  @override
  Widget build(BuildContext context) {
    final bool isUserMssg = mssg.role == 'user';
    return Row(
      mainAxisAlignment:
          isUserMssg ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300.w, minHeight: 35.h),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(isUserMssg
                      ? Assets.assetsImagesUserMssgBubble
                      : Assets.assetsImagesThothMssgBubble),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
              child: Text(
                mssg.content,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.brownWriting,
                  fontFamily: GoogleFonts.lora().fontFamily,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
