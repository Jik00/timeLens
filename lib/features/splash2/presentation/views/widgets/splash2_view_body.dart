import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/widgets/app_logo.dart';
import 'package:timelens/features/onboarding/presentation/views/onboarding_view.dart';

class Splash2ViewBody extends StatefulWidget {
  const Splash2ViewBody({super.key});

  @override
  State<Splash2ViewBody> createState() => _Splash2ViewBodyState();
}

class _Splash2ViewBodyState extends State<Splash2ViewBody>
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
          /// Centered logo + text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                  opacity: _logoFade,
                  child: const AppLogo(h: 160, w: 160),
                ),
                FadeTransition(
                  opacity: _textFade,
                  child: Text(
                    kAppTitle,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.splash2Color1,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
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
                  Assets.assetsImagesPyramidsplash2,
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
    Future.delayed(const Duration(milliseconds: 4500), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      }
    });
  }
}
