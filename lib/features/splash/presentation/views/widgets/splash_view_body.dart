import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  
  final List<String> _icons = [
    Assets.assetsImagesSplash1,
    Assets.assetsImagesSplash2,
    Assets.assetsImagesSplash3,
    Assets.assetsImagesSplash4,
    Assets.assetsImagesSplash6,
    Assets.assetsImagesSplash8,
    Assets.assetsImagesSplash7,
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _initTimer();

    _initNavigation();
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
        //backgroung WILL BE CHANGED SOON!
        SizedBox.expand(
          child: Image.asset(
            Assets.assetsImages7,
            fit: BoxFit.cover,
          ),
        ),
        
        // Dark edges effect using gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.6), // top darker
                Colors.transparent, // middle
                Colors.black.withOpacity(0.88), // bottom darker
              ],
            ),
          ),
        ),

        Center(
          child: ClipOval(
            child: Image.asset(
              _icons[_currentIndex],
              width: 140.w,
              height: 140.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }

 //our logic
  Future<Null> _initNavigation() {
    return Future.delayed(const Duration(seconds: 5), () {
    _timer?.cancel();

    Navigator.pushReplacementNamed(context, 'OnboardingView');

  });
  }

  Timer _initTimer() {
    return _timer = Timer.periodic(const Duration(milliseconds: 750), (timer) {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _icons.length;
    });
  });
  }

}
