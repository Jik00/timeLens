import 'package:flutter/material.dart';
import 'package:timelens/features/onboarding/presentation/views/onboarding_view.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const SplashView(),
    //     settings: settings,
    //   );
    
    case OnboardingView.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnboardingView(),
        settings: settings,
      );

    default:
      return null;
  }
}
