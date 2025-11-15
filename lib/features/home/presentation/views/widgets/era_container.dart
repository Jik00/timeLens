import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';

class EraContainer extends StatelessWidget {
  const EraContainer(
      {super.key,
      required this.eraName,
      required this.eraPic,
      required this.eraDate});

  final String eraName, eraPic, eraDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(34),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          StrokeTextCizel(
              title: eraName,
              colors: const [Colors.white, Colors.white],
              titleSize: 18,
              borderColor: AppColors.primaryColor),
          Container(
              width: 320.w,
              height: 297.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
              ),
              child: Image.asset(eraPic)),
          StrokeTextCizel(
              title: eraDate,
              colors: const [Colors.white, Colors.white],
              titleSize: 16,
              borderColor: AppColors.primaryColor),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
