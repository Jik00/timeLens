import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.primaryColor.withAlpha(150),
          width: 1.5.w,
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            // Color(0xFFF4C990),
            Color(0xFFF4C990).withAlpha(150),
            AppColors.parchment.withAlpha(150),
            AppColors.parchment.withAlpha(100),
            AppColors.parchment.withAlpha(150),
            Color(0xFFF4C990).withAlpha(150),
            //Color(0xFFF4C990),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC79A5A).withAlpha(77),
            blurRadius: 12.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 33.w,
            height: 33.h,
            decoration: const BoxDecoration(
              color: Color(0xFFD4A24A),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.chat,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 18.w),
          Text(
            context.loc.newChat,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.brownWriting,
            ),
          ),
        ],
      ),
    );
  }
}
