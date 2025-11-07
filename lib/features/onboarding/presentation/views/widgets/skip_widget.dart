import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.loc.onboardingSkip,
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.skipColor,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.lora().fontFamily),
        ),
        SizedBox(width: 4.w),
        Image.asset(
          Assets.assetsImagesSkipArrow,
          width: 19.w,
          height: 19.h,
        )
      ],
    );
  }
}
