import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';

class SendIcon extends StatelessWidget {
  const SendIcon({super.key, required this.onSend});

  final void Function()? onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: AppColors.brownWriting.withAlpha(220), width: 3.5.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.5.h),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.assetsImagesThothSendIconBackground,
                opacity: const AlwaysStoppedAnimation(0.88),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: -10.h,
              left: -10.w,
              child: IconButton(
                onPressed: onSend,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: AppColors.brownWriting.withAlpha(200),
                  fontWeight: FontWeight.bold,
                  size: 28.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
