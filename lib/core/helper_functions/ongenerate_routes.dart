import 'package:flutter/material.dart';
import 'package:timelens/features/auth/presentation/views/login_view.dart';
import 'package:timelens/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:timelens/features/splash/presentation/views/splash_view.dart';
import 'package:timelens/features/splash2/presentation/views/splash2_view.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
        settings: settings,
      );
    
    case OnboardingView.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnboardingView(),
        settings: settings,
      );

    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
        settings: settings,
      );

    case Splash2View.routeName:
      return MaterialPageRoute(
        builder: (_) => const Splash2View(),
        settings: settings,
      );

    default:
      return null;
  }
}
