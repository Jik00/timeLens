import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/widgets/timelens_title.dart';
import 'package:timelens/features/home/presentation/views/widgets/weather_glimpse_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
          alignment: AlignmentGeometry.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
            child: TimelensTitle(size: 28),
          ),
        ),
        Align(
          alignment: AlignmentGeometry.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 110.h, right: 5.w),
            child: const WeatherGlimpseBlocBuilder(),
          ),
        ),
      ],
    );
  }
}
