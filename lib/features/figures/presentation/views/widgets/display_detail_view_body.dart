import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/figures/presentation/views/widgets/details_column.dart';

class DisplayDetailViewBody extends StatelessWidget {
  const DisplayDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.assetsImagesBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 85.h,
            right: 10.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Hero(
                tag: kHeroTagImg,
                child: Image.asset(
                  Assets.assetsImagesRemsesStatue,
                  width: 175.w,
                ),
              ),
            ),
          ),
          const DetailsColumn(),
        ],
      ),
    );
  }
}
