import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/auth/presentation/cubits/auth_controller/auth_controller.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AuthController>().currentProfile;

    return profile == null
        ? const SizedBox.shrink()
        : Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: SizedBox(
                  width: 105.r,
                  height: 110.r,
                  child: SvgPicture.network(
                    profile.avatarUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ClipOval(
                child: SizedBox(
                  width: 150.r,
                  height: 150.r,
                  child: Image.asset(
                    Assets.assetsImagesProfileFrame,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          );
  }
}
