import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/auth/presentation/views/widgets/back_drop_filter.dart';
import 'package:timelens/features/profile/domain/entities/profile_entity.dart';
import 'package:timelens/features/profile/presentation/views/widgets/edit_menu_item.dart';
import 'package:timelens/features/profile/presentation/views/widgets/menu_item.dart';

class EditContainerStack extends StatelessWidget {
  const EditContainerStack({super.key, required this.profile});

  final ProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const BackDropFilter(h: 380),
        // Positioned(
        //   top: 0.h,
        //   left: 0.w,
        //   right: 0.w,
        //   child: Transform.scale(
        //     scaleX: 1.1.w,
        //     scaleY: 1.06.h,
        //     scale: 1,
        //     child: Image.asset(
        //       Assets.assetsImagesSquareFrame,
        //     ),
        //   ),
        // ),
        Positioned(
          top: 20.h,
          left: 0.w,
          right: 0.w,
          child: EditProfileForm(profile: profile),
        ),
      ],
    );
  }
}

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.profile,
  });

  final ProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            EditMenuItem(
              title: context.loc.userName,
              icon: Icons.person,
              hint: profile.name,
            ),
            SizedBox(height: 18.h),
            EditMenuItem(
              title: context.loc.language,
              icon: Icons.translate,
              hint: profile.language,
            ),
            SizedBox(height: 18.h),
            EditMenuItem(
              title: context.loc.Country,
              icon: Icons.language_outlined,
              hint: context.loc.egypt,
            ),
            SizedBox(height: 18.h),
            Container(
              width: 300.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withAlpha(50),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
              child: MenuItem(
                centered: true,
                icon: Icons.save_outlined,
                title: context.loc.save,
                noDivider: true,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.redAccent.withAlpha(50),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.red,
                ),
              ),
              child: MenuItem(
                centered: true,
                icon: Icons.cancel_outlined,
                title: context.loc.cancel,
                onTap: () {
                  Navigator.pop(context);
                },
                iconColor: Colors.red,
                trailingColor: Colors.red,
                noDivider: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
