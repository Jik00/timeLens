import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/custom_button.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/figures/presentation/views/widgets/slide_transition_widget.dart';
import 'package:timelens/features/test/test_view.dart';

import '../../../../../core/utils/app_images.dart';

class DetailsColumn extends StatelessWidget {
  const DetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 115),
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
                  colors: [AppColors.timeLensColor, Colors.white],
                  titleSize: 40,
                  borderColor: AppColors.brownWriting),
            ),
          ),
          SizedBox(height: 15.h),
          SlideTransitionWidget(
            child: Image.asset(
              Assets.assetsImagesWriting,
              height: 332.h,
              color: AppColors.brownWriting.withAlpha(200),
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
                Text(
                  'Age: ~ 90 years',
                  style: TextStyle(
                    color: AppColors.brownWriting.withAlpha(210),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Reign: ~ 66 years',
                  style: TextStyle(
                    color: AppColors.brownWriting.withAlpha(210),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '(1279–1213 BC)',
                  style: TextStyle(
                    color: AppColors.brownWriting.withAlpha(210),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Transform.translate(
            offset: Offset(-20.w, 0),
            child: CustomButton(
              hint: 'let\'s dive',
              scaleX: 0.8,
              onTap: () {
                Navigator.pushNamed(context, TestView.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
