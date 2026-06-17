import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/auth/presentation/cubits/auth_controller/auth_controller.dart';

class CityNameContainer extends StatelessWidget {
  const CityNameContainer({
    super.key,
    required this.cityName,
    this.icon, 
  });

  final String cityName;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(134),
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon ?? Assets.assetsImagesEgyptianEye,
              height: 28.h,
              width: 28.w,
            ),
            Padding(
              padding: getIt<AuthController>().currentLocale == const Locale('ar') ? EdgeInsets.only(right: 10.w) : EdgeInsets.only(left: 10.w),
              child: Text(
                cityName,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blurColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
