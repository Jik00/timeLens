import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/timelens_title.dart';
import 'package:timelens/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'homeViewId';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor1,
        elevation: 0,
        title: const TimelensTitle(
          size: 24,
        ),
      ),
      body: const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
