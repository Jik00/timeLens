import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/auth/presentation/views/widgets/blur_login_card.dart';
import 'package:timelens/features/auth/presentation/views/widgets/login_card.dart';

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
              Positioned.fill(
                  child: Image.asset(Assets.assetsImagesLoginBackground,
                      fit: BoxFit.cover)),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 136.h,
                child: Column(
                  children: [
                    Transform.scale(
                      scaleX: 1.1,
                      child: const StrokeTextCizel(
                          title: kAppTitle,
                          colors: [
                            AppColors.primaryColor,
                            AppColors.primaryColor,
                            AppColors.middleColor,
                            Colors.white
                          ],
                          titleSize: 50,
                          borderColor: AppColors.secondaryColor),
                    ),
                    SizedBox(height: 85.h),
                    const BlurLoginCard(),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 300.h,
                child: const LoginCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
