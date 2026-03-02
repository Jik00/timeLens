import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/weather/domain/entities/location_entity.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile(
      {super.key, required this.location, required this.onTap});

  final LocationEntity location;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 150.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Transform.scale(
                scaleY: 0.95,
                scaleX: 1.08,
                child: Image.asset(
                  Assets.assetsImagesSearchCityCard,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20.h,
              left: 75.w,
              child: Text(
                location.locationName,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brownWriting,
                ),
              ),
            ),
            Positioned(
              top: 70.h,
              left: 52.w,
              child: Text(
                location.country,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brownWriting.withAlpha(200),
                ),
              ),
            ),
            Positioned(
              top: 95.h,
              left: 52.w,
              child: Row(
                children: [
                  Text(
                    "${context.loc.lat}: ${location.lat}",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brownWriting.withAlpha(200),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "${context.loc.lon}: ${location.lon}",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brownWriting.withAlpha(200),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
