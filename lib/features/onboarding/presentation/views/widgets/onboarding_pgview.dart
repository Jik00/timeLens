import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/onboarding/presentation/views/widgets/pg_view_item.dart';

class OnboardingPgview extends StatelessWidget {
  const OnboardingPgview({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      children: [
        PgViewItem(
            img: Assets.assetsImages2,
            title: context.loc.onboarding1Title,
            subtitle: context.loc.onboarding1Subtitle),
        PgViewItem(
            img: Assets.assetsImages1,
            title: context.loc.onboarding2Title,
            subtitle: context.loc.onboarding2Subtitle),
        PgViewItem(
            img: Assets.assetsImages6,
            title: context.loc.onboarding3Title,
            subtitle: context.loc.onboarding3Subtitle),
      ],
    );
  }
}
