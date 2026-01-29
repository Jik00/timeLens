import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_colors.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  static const String routeName = 'testView';

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      appBar: AppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
         child: Text("jhh"),
        ),
      ),
    );
  }
}
