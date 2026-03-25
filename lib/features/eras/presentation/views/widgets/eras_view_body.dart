import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/eras/presentation/views/widgets/eras_view_bloc_builder.dart';

import '../../../../../core/utils/app_images.dart';

class ErasViewBody extends StatelessWidget {
  const ErasViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.assetsImagesBackground,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 62),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 82.h,
                    ),
                    StrokeTextCizel(
                      title: context.loc.homeTitle,
                      colors: const [Colors.white, Colors.white],
                      titleSize: 18,
                      borderColor: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              ),
              const ErasViewBlocBuilder(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40.h,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
