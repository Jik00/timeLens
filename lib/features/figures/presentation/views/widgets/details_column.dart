import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/services/navigation_service.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/custom_button.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/figures/domain/entities/figure_entity.dart';
import 'package:timelens/features/figures/presentation/views/widgets/slide_transition_animation.dart';
import 'package:timelens/features/vr_instructions/presentation/views/vr_instructions_view.dart';

import '../../../../../core/utils/app_images.dart';

class DetailsColumn extends StatelessWidget {
  const DetailsColumn({super.key, required this.figure});

  final FigureEntity figure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 95.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(-10.w, 0),
            child: Hero(
              tag: kHeroTagName,
              child: StrokeTextCizel(
                title: figure.figureName,
                colors: const [AppColors.timeLensColor, Colors.white],
                titleSize: 39,
                borderColor: AppColors.brownWriting,
              ),
            ),
          ),
          SizedBox(height: 25.h),
          SlideTransitionAnimation(
            child: Image.asset(
              Assets.assetsImagesWriting,
              height: 332.h,
              color: AppColors.brownWriting.withAlpha(200),
            ),
          ),
          SlideTransitionAnimation(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 34.h,
                ),
                Text(
                  '${context.loc.figureDynasty}: ${figure.dynasty}',
                  style: TextStyle(
                    color: AppColors.brownWriting.withAlpha(210),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${context.loc.figureReign}:',
                  style: TextStyle(
                    color: AppColors.brownWriting.withAlpha(210),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  figure.reignPeriod,
                  style: TextStyle(
                    color: AppColors.brownWriting.withAlpha(210),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Center(
            child: CustomButton(
              hint: figure.ready,
              isIgnored: figure.ready == "Coming Soon",
              onTap: () {
                NavigationService.pushGlobal(VrInstructionsView.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
