import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';

class BackgroundWithTopFrame extends StatelessWidget {
  const BackgroundWithTopFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              Assets.assetsImagesBackground,
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Image.asset(
                Assets.assetsImagesTopFrame,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
    );
  }
}