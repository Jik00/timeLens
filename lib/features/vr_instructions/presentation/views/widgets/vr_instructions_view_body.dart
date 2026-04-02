import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/auth/presentation/views/widgets/back_drop_filter.dart';
import 'package:timelens/features/vr_instructions/presentation/views/widgets/instruction_slider.dart';

class VrInstructionsViewBody extends StatelessWidget {
  const VrInstructionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.assetsImagesBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackDropFilter(),
          ),
          Align(
            // alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 250.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset(
                    kLottiePyramid,
                    width: 300.w,
                  ),
                  SizedBox(height: 20.h),
                  InstructionSlider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
