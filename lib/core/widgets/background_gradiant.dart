import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient(
      {super.key, required this.color1, required this.color2});

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1, //.withOpacity(0.6),
            color2, //.withOpacity(0.88),
          ],
        ),
      ),
    );
  }
}
