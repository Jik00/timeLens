import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/features/figures/presentation/views/widgets/base_square.dart';
import 'package:timelens/features/figures/presentation/views/widgets/figures_slider.dart';

class FigureViewBody extends StatelessWidget {
  const FigureViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          // Positioned(
          //   top: 50,
          //   child: Image.asset(
          //     Assets.assetsImagesTestFigureBackgroung,
          //     gaplessPlayback: true,
          //     height: 400.h,
          //   ),
          // ),
          Positioned(
            left: 21.w,
            child: Text(
              'Rulers of Ancient Egypt',
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.white,
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
