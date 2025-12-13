import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/features/figures/presentation/views/widgets/figure_view_body.dart';

class FigureView extends StatelessWidget {
  const FigureView({super.key});

  static const routeName = 'figure';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      appBar: buildAppBar(AppColors.blackBackground, null),
      body: const FigureViewBody(),
    );
  }
}