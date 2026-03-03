import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';

class TempColumn extends StatelessWidget {
  const TempColumn({super.key, required this.temp, required this.minTemp, required this.maxTemp});

  final String temp, minTemp, maxTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$temp°',
          style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.brownWriting,
          ),
        ),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$minTemp/$maxTemp ',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.brownWriting,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
