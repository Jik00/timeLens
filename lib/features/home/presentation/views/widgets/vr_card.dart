import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/eras/presentation/views/eras_view.dart';
import 'package:timelens/features/weather/presentation/views/widgets/city_name_container.dart';

class VrCard extends StatelessWidget {
  const VrCard({super.key, required this.title, required this.img});

  final String title, img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ErasView.routeName),
      child: SizedBox(
        height: 315.h,
        width: 332.w,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: CityNameContainer(
                cityName: title,
                icon: Assets.assetsImagesSunIcon,
              ),
            ),
            Positioned(
              bottom: -10.h,
              top: 5.h,
              child: Transform.scale(
                scaleY: 1.25,
                scaleX: 1.05,
                child: Image.asset(
                  Assets.assetsImagesSquareFrame,
                  width: 330.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
