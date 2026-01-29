import 'package:flutter/material.dart';
import 'package:timelens/features/test/era_container.dart';
class EraCard extends StatefulWidget {
  const EraCard({super.key});

  @override
  State<EraCard> createState() => _EraCardState();
}

class _EraCardState extends State<EraCard> {
  final ValueNotifier<double> slideProgress = ValueNotifier(0.0);

  @override
  void dispose() {
    slideProgress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: slideProgress,
      builder: (context, t, child) {
        final bgColor = Color.lerp(
          Colors.transparent,
          Colors.white,
          t,
        );
        return EraStack(bgColor: bgColor, slideProgress: slideProgress);
      },
    );
  }
}


