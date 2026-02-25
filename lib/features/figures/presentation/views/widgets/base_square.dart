import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';

class BaseSquare extends StatelessWidget {
  const BaseSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 188.h,
            child: SizedBox(
              width: 270.w,
              child: Image.asset(
                Assets.assetsImagesFigureBaseSquare,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned(
          //   top: 188.h,
          //   child:
          //
          // SizedBox(
          //   width: 380.w,
          //   child: Image.asset(
          //     Assets.assetsImagesWhiteLight,
          //     // color: Color(0xFFE4CE95).withOpacity(1),
          //     // colorBlendMode: BlendMode.modulate,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // ),
        ],
      ),
    );
  }
}
