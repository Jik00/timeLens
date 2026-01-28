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
          Positioned(
            right: 33.w,
            top: 130.h,
            child: Container(
              width: 135.w,
              height: 350.h,
              decoration: BoxDecoration(
                //color: Colors.white.withOpacity(0.2),
                color: const Color(0xFF91896B).withOpacity(0.6),
                borderRadius: BorderRadius.circular(100),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(),
              ),
            ),
          ),
          Positioned(
            right: 10.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Hero(
                tag: kHeroTagImg,
                child: Image.asset(
                  Assets.assetsImagesRamses2Statue,
                  width: 170.w,
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
