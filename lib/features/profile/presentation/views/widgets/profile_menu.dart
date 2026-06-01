import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/auth/presentation/cubits/auth_controller/auth_controller.dart';
import 'package:timelens/features/profile/presentation/views/widgets/edit_button.dart';
//import 'package:timelens/features/profile/presentation/views/widgets/edit_button.dart';
import 'package:timelens/features/profile/presentation/views/widgets/menu_item.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AuthController>().currentProfile;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 42.w),
              Text(
                context.loc.profile,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brownWriting,
                ),
              ),
              const Spacer(flex: 6),
              const EditButton(),
            ],
          ),
          const SizedBox(height: 2),
          const Divider(
            height: 1,
            color: AppColors.primaryColor,
          ),
          MenuItem(
              icon: Icons.person,
              title: context.loc.userName,
              trailingText: profile?.name),
          MenuItem(
              icon: Icons.email,
              title: context.loc.email,
              trailingText: profile?.email),
          MenuItem(
              icon: Icons.lock_outline_rounded,
              title: context.loc.password,
              trailingText: "********"),
          MenuItem(
              icon: Icons.language_outlined,
              title: context.loc.Country,
              trailingText: context.loc.egypt),
          MenuItem(
              icon: Icons.translate,
              title: context.loc.language,
              trailingText: context.loc.englishCode,
              noDivider: true),
        ],
      ),
    );
  }
}
