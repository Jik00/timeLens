import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';

class SendIcon extends StatelessWidget {
  const SendIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38.w,
      height: 38.h,
      child: Stack(
        children: [
          Container(
            width: 37.w,
            height: 37.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.brownWriting, width: 3.w),
            ),
            child: Image.asset(
              Assets.assetsImagesThothSendIconBackground,
              opacity: const AlwaysStoppedAnimation(0.88),
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: -3.h,
            left: -3.w,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_upward_rounded,
                color: AppColors.brownWriting.withAlpha(240),
                fontWeight: FontWeight.bold,
                size: 28.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
