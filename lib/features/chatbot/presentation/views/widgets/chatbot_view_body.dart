import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/app_bar_body.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/chat_body_bloc_builder.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/chat_text_field.dart';

class ChatbotViewBody extends StatelessWidget {
  const ChatbotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.assetsImagesBackground,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 120.h,
              top: 95.h,
            ),
            child: ChatBodyBlocBuilder(),
          ),
        ),
        Align(
          alignment: AlignmentGeometry.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
              right: 18.w,
              top: 45.h,
              bottom: 100.h,
            ),
            child: AppBarBody(),
          ),
        ),
        Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 60.h),
            child: ChatTextField(),
          ),
        ),
        Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 28.h),
            child: Text(
              context.loc.thothCanMakemistakes,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.brownWriting.withAlpha(150),
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lora().fontFamily,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
