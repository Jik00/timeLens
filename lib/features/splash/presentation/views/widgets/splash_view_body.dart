import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/widgets/app_logo.dart';
import 'package:timelens/core/widgets/background_gradiant.dart';
import 'package:timelens/core/widgets/timelens_title.dart';
import 'package:timelens/features/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoFade;
  late Animation<double> _textFade;
  late Animation<Offset> _pyramidSlide;

  @override
  void initState() {
    super.initState();
    _initAnimationController();
    _initAnimations();
    _startAnimation();
    _scheduleNavigation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          const BackgroundGradient(
              color1: AppColors.backgroundColor1,
              color2: AppColors.primaryColor),

          /// Centered logo + text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                  opacity: _logoFade,
                  child: const AppLogo(h: 180, w: 180),
                ),
                FadeTransition(
                  opacity: _textFade,
                  child: const TimelensTitle(),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),

          /// Pyramids animating from bottom → up
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _pyramidSlide,
              child: SizedBox(
                height: 230.h,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  Assets.assetsImagesPyramidSplash,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //our Logic

  void _initAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
  }

  void _initAnimations() {
    _logoFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    );

    _textFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
    );

    _pyramidSlide = Tween<Offset>(
      begin: const Offset(0, 1), // start completely off bottom
      end: Offset.zero, // stop at bottom
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  void _startAnimation() {
    _controller.forward();
  }

  void _scheduleNavigation() {
    Future.delayed(
      const Duration(milliseconds: 4500),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, OnboardingView.routeName);
        }
      },
    );
  }
}
