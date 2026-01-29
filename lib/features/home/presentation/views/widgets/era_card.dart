import 'package:flutter/material.dart';
import 'package:timelens/features/home/domain/entities/era_entity.dart';
import 'package:timelens/features/home/presentation/views/widgets/era_stack.dart';

class EraCard extends StatefulWidget {
  const EraCard({super.key, required this.eraEntity});

  final EraEntity eraEntity;

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
          //AppColors.primaryColor,
          t,
        );
        return EraStack(
          bgColor: bgColor,
          slideProgress: slideProgress,
          eraEntity: widget.eraEntity,
        );
      },
    );
  }
}
