import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';

class DefaultChatBody extends StatelessWidget {
  const DefaultChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}
