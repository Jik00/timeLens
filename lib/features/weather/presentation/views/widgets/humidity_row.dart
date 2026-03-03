import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';

class HumidityRow extends StatelessWidget {
  const HumidityRow({super.key, required this.icon, required this.text});

  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: icon == Assets.assetsImagesIconsHumidity ? 0.76 : 1,
          child: Image.asset(
            icon,
            height: 35.h,
            width: 35.w,
          ),
        ),
        // Spacer(),
        Text(
          textAlign: TextAlign.end,
          text,
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
