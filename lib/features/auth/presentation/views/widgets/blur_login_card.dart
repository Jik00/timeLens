import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';

class BlurLoginCard extends StatelessWidget {
  const BlurLoginCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      // child: BackdropFilter(
      // filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      child: Container(
        width: 340.w,
        height: 355.h,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor.withOpacity(0.18),
          borderRadius: BorderRadius.circular(34),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.6),
            width: 1.5,
          ),
        ),
        // ),
      ),
    );
  }
}
