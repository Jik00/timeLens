import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';

class EditMenuItem extends StatelessWidget {
  const EditMenuItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.child});

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brownWriting,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Container(
          alignment: Alignment.center,
          width: 300.w,
          height: 38.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.primaryColor,
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
