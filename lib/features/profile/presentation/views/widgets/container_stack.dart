import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/features/auth/presentation/views/widgets/back_drop_filter.dart';
import 'package:timelens/features/profile/presentation/views/widgets/profile_menu.dart';

class ContainerStack extends StatelessWidget {
  const ContainerStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const BackDropFilter(h: 260),
        // Positioned(
        //   top: 30.h,
        //   left: 0.w,
        //   right: 0.w,
        //   child: Transform.scale(
        //     scaleX: 1.5.w,
        //     scaleY: 1.71.h,
        //     child: Image.asset(
        //       Assets.assetsImagesSquareFrame,
        //     ),
        //   ),
        // ),
        Positioned(
          top: 30.h,
          left: 0.w,
          right: 0.w,
          child: const ProfileMenu(),
        ),
      ],
    );
  }
}
