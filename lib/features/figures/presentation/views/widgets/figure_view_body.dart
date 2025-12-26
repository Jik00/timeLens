import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/figures/presentation/views/widgets/base_square.dart';
import 'package:timelens/features/figures/presentation/views/widgets/figures_slider.dart';

class FigureViewBody extends StatelessWidget {
  const FigureViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.assetsImagesTestFigureBackgroung,
          opacity: const AlwaysStoppedAnimation(0.9),
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(
          height: 660.h,
          child: Stack(
            children: [
              Positioned(
                bottom: 97.h,
                child: const BaseSquare(),
              ),
              const FiguresSlider(),
            ],
          ),
        ),
      ],
    );
  }
}
