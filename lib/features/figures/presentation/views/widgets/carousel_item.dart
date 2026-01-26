import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';

import '../../../../../core/utils/app_images.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key, required this.isCenter});

  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if (isCenter) {
              Navigator.pushNamed(context, 'displayDetailView');
            }
          },
          child: isCenter
              ? Hero(
                  tag: kHeroTagImg,
                  createRectTween: (begin, end) {
                    return MaterialRectArcTween(begin: begin, end: end);
                  },
                  child: Image.asset(
                    Assets.assetsImagesRamses2Statue,
                    //width: 300.w,
                    height: 390.h,
                  ),
                )
              : Image.asset(
                  Assets.assetsImagesRamses2Statue,
                  //width: 300.w,
                  height: 390.h,
                  opacity: const AlwaysStoppedAnimation<double>(0.3),
                ),
        ),
        SizedBox(height: 105.h),
        Visibility(
          visible: isCenter,
          child: const Hero(
            tag: kHeroTagName,
            child: StrokeTextCizel(
                title: 'Ramses II',
                colors: [AppColors.timeLensColor, AppColors.timeLensColor],
                titleSize: 41,
                borderColor: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
