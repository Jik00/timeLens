import 'package:flutter/material.dart';
import 'package:timelens/features/onboarding/presentation/views/widgets/pg_view_item.dart';

class OnboardingPgview extends StatelessWidget {
  const OnboardingPgview({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      children: const [
        PgViewItem(),
      ],
    );
  }
}