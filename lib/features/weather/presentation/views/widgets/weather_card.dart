import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/helper_functions/file_to_htttp_url.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/weather/domain/entities/weather_entity.dart';
import 'package:timelens/features/weather/presentation/views/widgets/city_name_container.dart';
import 'package:timelens/features/weather/presentation/views/widgets/condition_column.dart';
import 'package:timelens/features/weather/presentation/views/widgets/humidity_row.dart';
import 'package:timelens/features/weather/presentation/views/widgets/temp_column.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weatherEntity});

  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      width: 350.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              Assets.assetsImagesGlassRectangle,
              height: 200.h,
              width: 320.w,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 6.w, top: 4.h),
              child: CityNameContainer(
                cityName: weatherEntity.locationName,
              ),
            ),
          ),
          Transform.scale(
            scaleY: 1.05,
            scaleX: 1.35,
            child: Image.asset(
              Assets.assetsImagesSquareFrame,
              // height: 220.h,
              width: 340.w,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 62.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: ConditionColumn(
                        conditionIcon: fileToHttp(weatherEntity.iconUrl),
                        conditionText: weatherEntity.conditionText),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 11.h),
                    child: TempColumn(
                      temp: weatherEntity.temperatureCelsius,
                      minTemp: weatherEntity.minTemp,
                      maxTemp: weatherEntity.maxTemp,
                    ),
                  ),
                  VerticalDivider(
                    indent: 10.h,
                    endIndent: 60.h,
                    width: 1.w,
                    color: AppColors.blurColor,
                    thickness: 1.5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HumidityRow(
                        icon: Assets.assetsImagesIconsWind,
                        text: '${weatherEntity.windmph}m/h',
                      ),
                      HumidityRow(
                        icon: Assets.assetsImagesIconsUvIndex,
                        text: '${weatherEntity.uvIndex}',
                      ),
                      HumidityRow(
                        icon: Assets.assetsImagesIconsHumidity,
                        text: '${weatherEntity.humidity}%',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
