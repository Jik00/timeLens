import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/features/splash2/presentation/views/widgets/splash2_view_body.dart';

class Splash2View extends StatelessWidget {
  const Splash2View({super.key});

  static const String routeName = 'splash2';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.splash2color2,
      body: SafeArea(
        child: Splash2ViewBody(),
      ),
    );
  }
}
