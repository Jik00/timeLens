import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/auth/presentation/views/widgets/back_drop_filter.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({super.key, required this.onConfirm});

  final VoidCallback onConfirm;

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      builder: (_) => LogoutAlert(
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 28.w),
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.assetsImagesBackground,
                fit: BoxFit.cover,
              ),
            ),
            const BackDropFilter(h: 310),
            Container(
              margin: EdgeInsets.all(20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withAlpha(38),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2.5.w,
                      ),
                    ),
                    child: Icon(
                      Icons.logout_rounded,
                      size: 34.sp,
                      color: AppColors.brownWriting,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    context.loc.logout,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brownWriting,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    context.loc.logoutConfirmation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.brownWriting,
                    ),
                  ),
                  SizedBox(height: 28.h),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                          label: Text(context.loc.cancel),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red.shade400,
                            side: BorderSide(
                              color: Colors.red.shade400,
                            ),
                            minimumSize: Size(
                              double.infinity,
                              52.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            onConfirm();
                          },
                          icon: const Icon(Icons.logout),
                          label: Text(context.loc.logout),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.brownWriting,
                            elevation: 0,
                            minimumSize: Size(
                              double.infinity,
                              52.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
