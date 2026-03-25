import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/services/shared_preferences_singleton.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/app_logo.dart';
//import 'package:timelens/features/eras/presentation/views/eras_view.dart';
//import 'package:timelens/features/chatbot/presentation/views/chatbot_view.dart';
import 'package:timelens/features/home/presentation/views/main_layout.dart';
import 'package:timelens/features/onboarding/presentation/views/onboarding_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/background_with_top_frame.dart';
import '../../../../../core/widgets/stroke_text_cinzel.dart';
//import '../../../../auth/presentation/views/login_view.dart';
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
          const BackgroundWithTopFrame( 
            img: Assets.assetsImagesTopFrame,
          ),

          /// Centered logo + text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                  opacity: _logoFade,
                  child: const AppLogo(h: 180, w: 180),
                ),
                SizedBox(height: 30.h),
                FadeTransition(
                  opacity: _textFade,
                  child: StrokeTextCizel(
                      title: context.loc.appTitle,
                      colors: const [
                        AppColors.timeLensColor,
                        AppColors.timeLensColor,
                        AppColors.middleColor,
                        Colors.white
                      ],
                      titleSize: 52,
                      borderColor: AppColors.brownWriting),

                  //     const TimelensTitle(
                  //   size: 52,
                  // ),
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
                width: double.maxFinite,
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
    bool isOnboardingSeen = Prefs.getBool(kIsOnboardingSeen);
    final navigator = Navigator.of(context);
    Future.delayed(
      const Duration(milliseconds: 4000),
      () {
        if (mounted) {
          if (isOnboardingSeen) {
            //Navigator.pushReplacementNamed(context, LoginView.routeName);
            //navigator.pushReplacementNamed(ErasView.routeName);
            //navigator.pushReplacementNamed(ChatbotView.routeName);
            navigator.pushReplacementNamed(MainLayout.routeName);

          } else {
            navigator.pushReplacementNamed(OnboardingView.routeName);
          }
        }
      },
    );
  }
}
