import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.message,
    this.onTap,
  });

  final String message;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 200.h),
          Icon(
            Icons.error,
            color: AppColors.textColor,
            size: 100.sp,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.brownWriting.withAlpha(200),
              fontFamily: GoogleFonts.lora().fontFamily,
            ),
          ),
          const SizedBox(height: 24),
          Visibility(
            visible: onTap != null,
            child: CustomButton(
              hint: context.loc.retry,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
