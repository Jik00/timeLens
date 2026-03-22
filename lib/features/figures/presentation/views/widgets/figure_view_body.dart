import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/figures/domain/entities/figure_entity.dart';
import 'package:timelens/features/figures/presentation/views/widgets/figures_slider.dart';

import '../../../../../core/utils/app_images.dart';

class FigureViewBody extends StatelessWidget {
  const FigureViewBody({super.key, required this.figures});

  final List<FigureEntity> figures;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
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
              bottom: 160.h,
              left: 55.w,
              child: SizedBox(
                width: 270.w,
                child: Image.asset(
                  Assets.assetsImagesFigureBaseSquare,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 90.h,
              child: Column(
                children: [
                  Text(
                    context.loc.figuresTitle,
                    style: TextStyle(
                      fontSize: 23.sp,
                      color: AppColors.brownWriting,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const FiguresSlider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
