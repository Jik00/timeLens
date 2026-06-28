import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/background_with_top_frame.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/auth/presentation/cubits/auth_controller/auth_controller.dart';
import 'package:timelens/features/profile/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:timelens/features/profile/presentation/views/widgets/container_stack.dart';
import 'package:timelens/features/profile/presentation/views/widgets/logout_alert.dart';
import 'package:timelens/features/profile/presentation/views/widgets/menu_item.dart';
import 'package:timelens/features/profile/presentation/views/widgets/profile_avatar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AuthController>().currentProfile;

    String name = profile?.name ?? context.loc.timeTraveler;

    return SizedBox.expand(
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
                    ProfileAvatar(profile: profile),
                    SizedBox(height: 4.h),
                    StrokeTextCizel(
                      title: name,
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
                    ContainerStack(
                    ),
                    SizedBox(height: 42.h),
                    Container(
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withAlpha(50),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Colors.red,
                        ),
                      ),
                      child: MenuItem(
                        icon: Icons.logout,
                        title: context.loc.logout,
                        onTap: () {
                            LogoutAlert.show(
                              context,
                              onConfirm: () {
                                
                                context.read<LogoutCubit>().logout();
                              },
                            );
                        },
                        iconColor: Colors.red,
                        trailingColor: Colors.red,
                        noDivider: true,
                      ),
                    ),
                    SizedBox(height: 100.h),
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
