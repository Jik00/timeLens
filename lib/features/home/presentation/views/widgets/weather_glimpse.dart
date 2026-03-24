import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/services/navigation_service.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/weather/presentation/views/weather_view.dart';
import 'package:timelens/features/weather/presentation/views/widgets/city_name_container.dart';

class WeatherGlimpse extends StatelessWidget {
  const WeatherGlimpse(
      {super.key,
      required this.city,
      required this.temp,
      required this.condition});

  final String city, temp, condition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationService.navigateWithinTab(context, WeatherView.routeName),
      child: SizedBox(
        height: 145.h,
        width: 325.w,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.assetsImagesWeatherPicCut,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                Assets.assetsImagesWeatherClouds,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: CityNameContainer(
                cityName: city,
              ),
            ),
            Positioned(
              bottom: -10.h,
              top: 5.h,
              child: Transform.scale(
                scaleY: 1.16,
                scaleX: 1.9999,
                child: Image.asset(
                  Assets.assetsImagesSquareFrame,
                  width: 330.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 50.h,
              left: 30.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$temp°',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp,
                    ),
                  ),
                  Text(
                    condition,
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
