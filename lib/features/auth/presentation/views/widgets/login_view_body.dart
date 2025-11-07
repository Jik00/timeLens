import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/widgets/background_theme.dart';
import 'package:timelens/features/auth/presentation/views/widgets/blur_login_card.dart';
import 'package:timelens/features/auth/presentation/views/widgets/login_card.dart';
import 'package:timelens/features/auth/presentation/views/widgets/login_title.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1.6.sh,
        child: Stack(
          children: [
            const BackgroundTheme(img: Assets.assetsImagesPyramidLogin),
            Positioned(
              left: 0,
              right: 0,
              top: 136.h,
              child: Column(
                children: [
                  Transform.scale(
                    scaleX: 1.1,
                    child: const LoginTitle(
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
    );
  }
}
