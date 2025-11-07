import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key, required this.w, required this.h,
  });

  final int w, h;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        Assets.assetsImagesAppIcon,
        width: w.w,
        height: h.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
