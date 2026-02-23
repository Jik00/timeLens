import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/features/figures/presentation/views/widgets/base_square.dart';
import 'package:timelens/features/figures/presentation/views/widgets/figures_slider.dart';

import '../../../../../core/utils/app_images.dart';

class FigureViewBody extends StatelessWidget {
  const FigureViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.assetsImagesBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 27.w,
            child: Text(
              'Rulers of Ancient Egypt',
              style: TextStyle(
                fontSize: 23.sp,
                color: AppColors.brownWriting,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            bottom: 200.w,
            child: const BaseSquare(),
          ),
          const FiguresSlider(),
        ],
      ),
    );
  }
}
