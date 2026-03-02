import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';

class ConditionColumn extends StatelessWidget {
  const ConditionColumn(
      {super.key, required this.conditionIcon, required this.conditionText});

  final String conditionIcon, conditionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          Assets.assetsImagesIconsUvIndex,
          height: 55.h,
          width: 55.w,
        ),
        SizedBox(height: 12.h),
        Text(
          "Sunny",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.brownWriting,
          ),
        ),
      ],
    );
  }
}
