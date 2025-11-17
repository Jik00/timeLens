import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42.w,
      height: 32.h,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: Center(
        child: Image.asset(
          img,
          height: 24.h,
          width: 24.w,
          color: Colors.white,
        ),
      ),
    );
  }
}
