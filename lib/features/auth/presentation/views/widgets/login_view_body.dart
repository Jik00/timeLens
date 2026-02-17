import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/background_with_top_frame.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/auth/presentation/views/widgets/back_drop_filter.dart';
import 'package:timelens/features/auth/presentation/views/widgets/text_fields_column.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
              const BackgroundWithTopFrame(),
              Positioned(
                left: 0,
                right: 0,
                top: 220.h,
                child: Column(
                  children: [
                    Transform.scale(
                      scaleX: 1.1,
                      child: StrokeTextCizel(
                          title: context.loc.login,
                          colors: const [
                            AppColors.timeLensColor,
                            AppColors.timeLensColor,
                            AppColors.middleColor,
                            Colors.white
                          ],
                          // colors: [
                          //   AppColors.brownWriting.withOpacity(0.5),
                          //   AppColors.brownWriting.withOpacity(0.5),
                          // ],
                          titleSize: 50,
                          borderColor: AppColors.brownWriting),
                    ),
                    SizedBox(height: 50.h),
                    const BackDropFilter(),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 300.h,
                child: Transform.scale(
                  scaleX: 1.65,
                  scaleY: 1.65,
                  child: Image.asset(
                    Assets.assetsImagesSquareFrame,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 370.h,
                child: const TextFieldsColumn(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
