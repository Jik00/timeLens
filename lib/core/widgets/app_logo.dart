import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        Assets.assetsImagesAppIcon,
       // Assets.assetsImagesPharaoh,
        width: 105.w,
        height: 105.h,
        fit: BoxFit.cover,
      ),
    );
  }
}