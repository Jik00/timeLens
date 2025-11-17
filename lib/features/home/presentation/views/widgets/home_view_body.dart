import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/background_gradiant.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/home/presentation/views/widgets/custom_button_navigation_bar.dart';
import 'package:timelens/features/home/presentation/views/widgets/era_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundGradient(
          color1: AppColors.backgroundColor1,
          color2: AppColors.primaryColor,
        ),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
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
            const EraListview(),
          ],
        ),
        const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomButtonNavigationBar(),
          ),
        ),
      ],
    );
  }
}
