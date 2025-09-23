import 'package:flutter/material.dart';
import 'package:timelens/features/onboarding/presentation/views/widgets/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const String routeName = 'OnboardingView';
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: 
      OnboardingBody()),
    );
  }
}