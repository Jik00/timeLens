import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';

class CustomButtonNavigationBar extends StatelessWidget {
  const CustomButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.w,
      height: 43.h,
      decoration: ShapeDecoration(
        color: AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45.r),
          topRight: Radius.circular(45.r),
        )),
        shadows: [
          BoxShadow(
            color: AppColors.secondaryColor,
            blurRadius: 10.r,
            offset: const Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}
