import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';

class IconTextField extends StatelessWidget {
  const IconTextField({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Image.asset(
        img,
        color: AppColors.primaryColor,
        width: 18.w,
        height: 18.h,
      ),
    );
  }
}
