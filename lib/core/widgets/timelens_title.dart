import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';

class TimelensTitle extends StatelessWidget {
  const TimelensTitle({super.key, required this.size});

  final int size;

  @override
  Widget build(BuildContext context) {
    return Text(
      kAppTitle,
      style: TextStyle(
        fontSize: size.sp,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: [AppColors.brownWriting, AppColors.brownWriting],
            //colors: [AppColors.timeLensColor, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
      ),
    );
  }
}
