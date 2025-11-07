import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/onboarding/presentation/views/widgets/pg_view_item.dart';

class OnboardingPgview extends StatelessWidget {
  const OnboardingPgview({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      children: [
        PgViewItem(
            isVisible: true,
            img: Assets.assetsImagesBookOnboarding,
            title: context.loc.onboarding1Title,
            subtitle: context.loc.onboarding1Subtitle),
        PgViewItem(
            isVisible: true,
            img: Assets.assetsImagesWallsOnboarding,
            title: context.loc.onboarding2Title,
            subtitle: context.loc.onboarding2Subtitle),
        PgViewItem(
            isVisible: false,
            img: Assets.assetsImagesWritingOnboarding,
            title: context.loc.onboarding3Title,
            subtitle: context.loc.onboarding3Subtitle),
      ],
    );
  }
}
