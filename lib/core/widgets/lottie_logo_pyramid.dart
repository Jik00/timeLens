import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:timelens/constants.dart';

class LottieLogoPyramid extends StatelessWidget {
  const LottieLogoPyramid({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Lottie.asset(
        kSplashAnimation,
        width: 140.w,
        height: 140.h,
        fit: BoxFit.cover,
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward()
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                _controller.repeat();
              }
            });
        },
      ),
    );
  }
}


