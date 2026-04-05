import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/background_with_top_frame.dart';
import 'package:timelens/features/weather/presentation/views/widgets/city_search_anchor.dart';
import 'package:timelens/features/weather/presentation/views/widgets/weather_body_bloc_builder.dart';

class WeatherViewBody extends StatelessWidget {
  const WeatherViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1.2,
        child: Stack(
          children: [
            BackgroundWithTopFrame(img: Assets.assetsImagesWeatherHeadingCut),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 105.h),
                child: Text(
                  context.loc.weather,
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brownWriting,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.5),
              child: CitySearchAnchor(),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: const WeatherBodyBlocBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
