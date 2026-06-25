import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/auth/presentation/views/widgets/back_drop_filter.dart';

class CheckMailAlert extends StatelessWidget {
  const CheckMailAlert({super.key, required this.onConfirm});

  final VoidCallback onConfirm;

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      builder: (_) => CheckMailAlert(
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
            const BackDropFilter(h: 170),
            Container(
              margin: EdgeInsets.all(20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.loc.goCheckYourEmail,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brownWriting,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            onConfirm();
                          },
                          icon: const Icon(Icons.email_outlined),
                          label: Text(context.loc.yesIgotTheLink),
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
