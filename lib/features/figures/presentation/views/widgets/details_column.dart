import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/widgets/custom_button.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';

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
            offset: Offset(-103.w, 0),
            child: const Hero(
              tag: kHeroTagName,
              child: StrokeTextCizel(
                  title: 'Ramses ||',
                  colors: [Colors.white, Colors.white],
                  titleSize: 30,
                  borderColor: AppColors.primaryColor),
            ),
          ),
          SizedBox(height: 10.h),
          Image.asset(
            Assets.assetsImagesWriting,
            height: 330.h,
          ),
          SizedBox(
            height: 45.h,
          ),
          const Text(
            'Age: ~ 90 years',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Reign: ~ 66 years',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '(1279–1213 BC)',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(
            height: 32,
          ),
          const CustomButton(
            hint: 'start the journey',
            w: 50,
            //fillColor: AppColors.newsecondaryColor,
          ),
        ],
      ),
    );
  }
}
