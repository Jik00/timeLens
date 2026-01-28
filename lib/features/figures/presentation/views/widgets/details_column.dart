import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/custom_button.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/figures/presentation/views/widgets/slide_transition_widget.dart';

import '../../../../../core/utils/app_images.dart';

class DetailsColumn extends StatelessWidget {
  const DetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(-78.w, 0),
            child: const Hero(
              tag: kHeroTagName,
              child: StrokeTextCizel(
                  title: 'Ramses II',
                  colors: [AppColors.timeLensColor, AppColors.timeLensColor],
                  titleSize: 40,
                  borderColor: AppColors.primaryColor),
            ),
          ),
          SizedBox(height: 15.h),
          SlideTransitionWidget(
            child: Image.asset(
              Assets.assetsImagesWriting,
              height: 332.h,
            ),
          ),
          SlideTransitionWidget(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                const Text(
                  'Age: ~ 90 years',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Reign: ~ 66 years',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '(1279–1213 BC)',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          CustomButton(
            hint: 'start z journey',
            w: 200,
            fillColor: AppColors.timeLensColor.withOpacity(0.38),
            borderColor: AppColors.timeLensColor.withOpacity(0.38),
          ),
        ],
      ),
    );
  }
}
