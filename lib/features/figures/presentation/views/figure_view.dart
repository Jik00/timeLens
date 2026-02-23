import 'package:flutter/material.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/core/widgets/custom_button_navigation_bar.dart';
import 'package:timelens/features/figures/presentation/views/widgets/figure_view_body.dart';

class FigureView extends StatelessWidget {
  const FigureView({super.key});

  static const routeName = 'figure';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(Colors.transparent, null),
      bottomNavigationBar: const CustomButtonNavigationBar(),
      extendBody: true,
      body: const FigureViewBody(),
    );
  }
}
