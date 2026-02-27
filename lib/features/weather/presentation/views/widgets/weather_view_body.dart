import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/background_with_top_frame.dart';

class WeatherViewBody extends StatelessWidget {
  const WeatherViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Stack(
        children: [
          BackgroundWithTopFrame(img: Assets.assetsImagesWeatherHeadingCut),
          Align(
            alignment: Alignment(0, -0.75),
            child: Text(
              context.loc.weather,
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.brownWriting,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
