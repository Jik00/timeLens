import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';

import '../../../../../core/utils/app_images.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key, required this.isCenter});

  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StrokeTextCizel(
            title: 'Ramses ||',
            colors: [Colors.white, Colors.white],
            titleSize: 30,
            borderColor: AppColors.primaryColor),
        SizedBox(height: 60.h),
        Image.asset(
          Assets.assetsImagesRamses2Statue,
          width: 300.w,
          height: 397.h,
          opacity: isCenter
              ? const AlwaysStoppedAnimation<double>(1)
              : const AlwaysStoppedAnimation<double>(0.3),
        ),
      ],
    );
  }
}
