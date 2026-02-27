import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.hint,
    this.onTap,
    this.scaleX,
  });

  final String hint;
  final VoidCallback? onTap;
  final double? scaleX;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 220.w,
        height: 70.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Transform.scale(
                scaleX: scaleX ?? 1,
                child: Image.asset(
                  Assets.assetsImagesButtonFrame,
                  height: 65.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  hint,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.sp,
                    color: AppColors.brownWriting.withAlpha(227),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
