import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/widgets/app_logo.dart';

class AnimateIconsSplash extends StatelessWidget {
  const AnimateIconsSplash({
    super.key,
    required bool showLogo,
    required List<String> icons,
    required int currentIndex,
  }) : _showLogo = showLogo, _icons = icons, _currentIndex = currentIndex;

  final bool _showLogo;
  final List<String> _icons;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: _showLogo
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppLogo( h: 105, w: 105,),
                Text(
                  kAppTitle,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            )
          : ClipOval(
              child: Image.asset(
                _icons[_currentIndex],
                key: ValueKey<int>(_currentIndex),
                width: 100.w,
                height: 100.h,
                fit: BoxFit.fill,
              ),
            ),
    );
  }
}
