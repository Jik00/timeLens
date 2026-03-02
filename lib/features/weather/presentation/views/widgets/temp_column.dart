import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';

class TempColumn extends StatelessWidget {
  const TempColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '27°',
          style: TextStyle(
            fontSize: 42.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.brownWriting,
          ),
        ),
        // SizedBox(height: 4.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '12/27 ',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.brownWriting,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
