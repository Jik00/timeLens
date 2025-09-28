import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/widgets/background_theme.dart';
import 'package:timelens/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:timelens/features/splash/presentation/views/widgets/animate_icons_splash.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  final List<String> _icons = [
    Assets.assetsImagesSplash2,
    Assets.assetsImagesSplash1,
    Assets.assetsImagesSplash4,
    Assets.assetsImagesSplash7,
  ];

  int _currentIndex = 0;
  Timer? _timer;
  bool _showLogo = false;

  @override
  void initState() {
    super.initState();
    
    _startSplashFlow();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       const BackgroundTheme(img: Assets.assetsImages7,),

        Center(
          child: AnimateIconsSplash(showLogo: _showLogo, icons: _icons, currentIndex: _currentIndex),
        ),
      ],
    );
  }

  //our logic
  Timer _initTimer() {
    return _timer = Timer.periodic(const Duration(milliseconds: 600), (timer) {
      setState(() {
        _currentIndex =
            (_currentIndex + 1) % _icons.length;
      });
    });
  }

  void _startSplashFlow() {
    _initTimer();

    // end timer
    Future.delayed(const Duration(seconds: 3), () {
      _timer?.cancel();
      setState(() => _showLogo = true);
    });

    // navigate next
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    });
  }
}