import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';

class AppBarBody extends StatelessWidget {
  const AppBarBody({super.key});

  @override
  Widget build(BuildContext context) {

    final bool canPop = Navigator.canPop(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: canPop,
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 28.sp,
              color: AppColors.brownWriting,
            ),
          ),
        ),
        Spacer(),
        Text(
          context.loc.thoth,
          style: TextStyle(
            fontSize: 23.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.brownWriting,
          ),
        ),
       Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.history_rounded,
            size: 28.sp,
            color: AppColors.brownWriting,
          ),
        ),
      ],
    );
  }
}
