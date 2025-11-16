import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/home/presentation/views/widgets/era_container.dart';

class EraListview extends StatelessWidget {
  const EraListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: const EraContainer(
              eraName: 'the new kingdom',
              eraPic: Assets.assetsImagesNewKingdomPic,
              eraDate: '(1550 BC – 1070 BC)',
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
