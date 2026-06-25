import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/background_with_top_frame.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/auth/presentation/views/widgets/back_drop_filter.dart';
import 'package:timelens/features/auth/presentation/views/widgets/reset_pass_column.dart';

class ResetPassViewBody extends StatelessWidget {
  const ResetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom * 1.3,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const BackgroundWithTopFrame(
                img: Assets.assetsImagesTopFrame,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 220.h,
                child: Column(
                  children: [
                    StrokeTextCizel(
                      title: context.loc.resetPassword,
                      colors: const [
                        AppColors.timeLensColor,
                        AppColors.timeLensColor,
                        AppColors.middleColor,
                        Colors.white
                      ],
                      titleSize: 28,
                      borderColor: AppColors.brownWriting,
                    ),
                    SizedBox(height: 40.h),
                    const BackDropFilter(h: 300),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 370.h,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: ResetPassColumn(),
                  ),
                ),
              ),
              Positioned(
                left: 130.w,
                // right: 0,
                top: 670.h,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    context.loc.backToLogin,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.brownWriting,
                      fontFamily: GoogleFonts.lora().fontFamily,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.brownWriting.withAlpha(179),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
