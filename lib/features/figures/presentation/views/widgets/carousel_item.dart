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
        Visibility(
          visible: isCenter,
          child: const StrokeTextCizel(
              title: 'Ramses ||',
              colors: [Colors.white, Colors.white],
              titleSize: 30,
              borderColor: AppColors.primaryColor),
        ),
        SizedBox(height: 60.h),
        GestureDetector(
          onTap: () {
            if (isCenter) {
              Navigator.pushNamed(context, 'displayDetailView');
            }
          },
          child: Image.asset(
            Assets.assetsImagesRamses2Statue,
            width: 300.w,
            height: 397.h,
            opacity: isCenter
                ? const AlwaysStoppedAnimation<double>(1)
                : const AlwaysStoppedAnimation<double>(0.3),
          ),
        ),
      ],
    );
  }
}
