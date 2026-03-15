import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  static const String routeName = 'testView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
