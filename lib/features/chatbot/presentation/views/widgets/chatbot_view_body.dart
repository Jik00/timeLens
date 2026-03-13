import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
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
        Visibility(
          child: Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              context.loc.thothAskAbout,
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.brownWriting.withAlpha(150),
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lora().fontFamily,
              ),
            ),
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
