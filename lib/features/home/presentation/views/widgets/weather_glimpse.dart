import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      onTap: () =>
          Navigator.pushNamed(context, WeatherView.routeName),
      child: SizedBox(
        height: 150.h,
        width: 325.w,
        child: Padding(
          padding: EdgeInsets.only(top: 6.h),
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
                top: -55.h,
                left: 6.w,
                right: 6.w,
                child: Transform.scale(
                  scaleY: 0.64,
                  scaleX: 1.1,
                  child: Image.asset(
                    Assets.assetsImagesSquareFrame,
                    width: 320.w,
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
      ),
    );
  }
}
