import 'package:flutter/material.dart';
import 'package:timelens/features/auth/presentation/views/login_view.dart';
import 'package:timelens/features/figures/presentation/views/display_detail_view.dart';
import 'package:timelens/features/figures/presentation/views/figure_view.dart';
import 'package:timelens/features/home/presentation/views/home_view.dart';
import 'package:timelens/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:timelens/features/splash/presentation/views/splash_view.dart';

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

    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeView(),
        settings: settings,
      );

    case FigureView.routeName:
      return MaterialPageRoute(
        builder: (_) => const FigureView(),
        settings: settings,
      );

    case DisplayDetailView.routeName:
      return PageRouteBuilder(
        settings: settings,
        transitionDuration: const Duration(milliseconds: 550),
        reverseTransitionDuration: const Duration(milliseconds: 550),
        pageBuilder: (_, animation, __) => const DisplayDetailView(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
      );

    default:
      return null;
  }
}
