import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.splashcolor2,
      body: SafeArea(
        child: SplashViewBody(),
      ),
    );
  }
}
