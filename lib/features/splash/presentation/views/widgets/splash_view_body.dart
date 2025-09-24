import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/widgets/app_logo.dart';
import 'package:timelens/features/splash/presentation/views/widgets/lottie_logo_pyramid.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
//
  bool isLogo = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    initAnimation();
    toggleLogo();
    initNavigation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
//backgroung WILL BE CHANGED SOON!
        SizedBox.expand(
          child: Image.asset(
            Assets.assetsImages0,
            fit: BoxFit.cover,
          ),
        ),
//
        Center(
          child: AnimatedCrossFade(
            crossFadeState:
                isLogo ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            firstCurve: Curves.bounceInOut,
//
            firstChild: LottieLogoPyramid(controller: _controller),
            secondChild: const AppLogo(),
          ),
        ),
      ],
    );
  }

  // our init logic
  Future<Null> toggleLogo() {
    return Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        isLogo = false;
      });
    });
  }

  Future<Null> initNavigation() {
    return Future.delayed(const Duration(milliseconds: 3700), () {
      Navigator.pushReplacementNamed(context, 'OnboardingView');
    });
  }

  AnimationController initAnimation() {
    return _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
  }
}
