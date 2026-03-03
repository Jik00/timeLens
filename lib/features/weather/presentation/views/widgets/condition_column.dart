import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';

class ConditionColumn extends StatelessWidget {
  const ConditionColumn(
      {super.key, required this.conditionIcon, required this.conditionText});

  final String conditionIcon, conditionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          conditionIcon,
          height: 50.h,
          width: 50.w,
        ),
        SizedBox(height: 12.h),
        Text(
          conditionText,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.brownWriting,
          ),
        ),
      ],
    );
  }
}
