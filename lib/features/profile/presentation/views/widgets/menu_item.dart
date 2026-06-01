import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailingText,
    this.trailingColor,
    this.iconColor,
    this.noDivider,
    this.centered,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final String? trailingText;
  final Color? trailingColor, iconColor;
  final bool? noDivider;
  final bool? centered;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: Row(
              mainAxisAlignment: centered == true
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 20.sp,
                  color: iconColor ?? AppColors.primaryColor,
                ),
                SizedBox(width: 12.w),
                centered == true
                    ? Text(
                        title,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: icon == Icons.logout
                              ? Colors.red
                              : AppColors.brownWriting,
                        ),
                      )
                    : Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: icon == Icons.logout
                                ? Colors.red
                                : AppColors.brownWriting,
                          ),
                        ),
                      ),
                if (centered != true)
                  Text(
                    trailingText ?? "",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: trailingColor ?? AppColors.brownWriting,
                    ),
                  ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: noDivider != true,
          child: const Divider(height: 1, color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
