import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';

class BaseSquare extends StatelessWidget {
  const BaseSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 65.h,
          child: SizedBox(
            width: 270,
            child: Image.asset(
              Assets.assetsImagesStatueSquare,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 380.w,
          child: Image.asset(
            Assets.assetsImagesWhiteLight,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
