import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';

class BaseSquare extends StatelessWidget {
  const BaseSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
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
            // color: Color(0xFFE4CE95).withOpacity(1),
            // colorBlendMode: BlendMode.modulate,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
