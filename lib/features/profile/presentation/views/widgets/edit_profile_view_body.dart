import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/background_with_top_frame.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/auth/presentation/cubits/auth_controller/auth_controller.dart';
import 'package:timelens/features/profile/presentation/views/widgets/edit_container_stack.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AuthController>().currentProfile;

    return profile == null ? SizedBox.shrink() :
    
     SizedBox.expand(
      child: Stack(
        children: [
          const BackgroundWithTopFrame(
            img: Assets.assetsImagesTopFrame,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 200.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StrokeTextCizel(
                      title: context.loc.editProfile,
                      //title: context.loc.profile,
                      colors: const [
                        AppColors.timeLensColor,
                        AppColors.timeLensColor,
                        AppColors.middleColor,
                        AppColors.middleColor,
                        Colors.white
                      ],
                      titleSize: 24,
                      borderColor: AppColors.brownWriting,
                    ),
                    SizedBox(height: 24.h),
                    EditContainerStack( profile : profile ),
                  //  SizedBox(height: 42.h),
                    
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