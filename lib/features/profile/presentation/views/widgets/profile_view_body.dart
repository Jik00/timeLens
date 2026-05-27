import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/background_with_top_frame.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/profile/presentation/views/widgets/container_stack.dart';
import 'package:timelens/features/profile/presentation/views/widgets/profile_avatar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          const BackgroundWithTopFrame(
            img: Assets.assetsImagesTopFrame,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 180.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StrokeTextCizel(
                        title: context.loc.profile,
                        colors: const [
                          AppColors.timeLensColor,
                          AppColors.timeLensColor,
                          AppColors.middleColor,
                          Colors.white
                        ],
                        titleSize: 32,
                        borderColor: AppColors.brownWriting),
                    SizedBox(height: 2.h),
                    ProfileAvatar(),
                    SizedBox(height: 20.h),
                    const ContainerStack(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
