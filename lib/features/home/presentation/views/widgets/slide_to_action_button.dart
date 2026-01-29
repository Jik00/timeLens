import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_action/slide_action.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/features/figures/presentation/views/figure_view.dart';

class SlideToActionButton extends StatelessWidget {
  const SlideToActionButton(
      {super.key, required this.progressNotifier, required this.title});

  final ValueNotifier<double> progressNotifier;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      child: SlideAction(
        trackHeight: 37.h,
        stretchThumb: true,
        trackBuilder: (context, state) {
          final double t = state.thumbFractionalPosition.clamp(0.0, 1.0);
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              if (progressNotifier.value != t) {
                progressNotifier.value = t;
              }
            },
          );
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(24.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 32.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 8.w),
                Transform.rotate(
                  angle: -0.5 * 3.14,
                  child: Lottie.asset(
                    width: 40.w,
                    kLottieRightArrow,
                    delegates: LottieDelegates(
                      values: [
                        ValueDelegate.colorFilter(
                          const ['**'],
                          value: const ColorFilter.mode(
                            Colors.white,
                            //AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        thumbBuilder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(999),
            ),
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: state.isPerformingAction
                  ? const CupertinoActivityIndicator(
                      color: AppColors.newsecondaryColor,
                      radius: 10,
                    )
                  : const Icon(Icons.chevron_right,
                      color: AppColors.newsecondaryColor, size: 28),
            ),
          );
        },
        action: () {
          Navigator.pushNamed(context, FigureView.routeName);
        },
      ),
    );
  }
}
