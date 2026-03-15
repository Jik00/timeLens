import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300.w, minHeight: 35.h),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.assetsImagesUserMssgBubble),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Text(
                'Hello, how are you you you you you',
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
