import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  bool isLogo = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        isLogo = false;
      });
    });

    Future.delayed(const Duration(milliseconds: 3700), () {
      Navigator.pushReplacementNamed(context, 'OnboardingView');
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedCrossFade(
        crossFadeState:
            isLogo ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        firstCurve: Curves.bounceInOut,
        firstChild: ClipOval(
          child: Lottie.asset(
            kSplashAnimation,
            width: 150.w,
            height: 150.h,
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
        ),
        secondChild: ClipOval(
          child: Image.asset(
            Assets.assetsImagesAppIcon,
            width: 140.w,
            height: 140.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
