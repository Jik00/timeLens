import 'dart:ui';

import 'package:flutter/material.dart';

class BackDropFilter extends StatelessWidget {
  const BackDropFilter(
      {super.key,
      required this.sigmaX,
      required this.sigmaY,
      required this.child});

  final double sigmaX, sigmaY;
  final Widget child;

  @override

  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );
  }
}
