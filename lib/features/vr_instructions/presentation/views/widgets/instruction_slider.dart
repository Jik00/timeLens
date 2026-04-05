import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';

class InstructionSlider extends StatefulWidget {
  const InstructionSlider({super.key});

  @override
  State<InstructionSlider> createState() => _InstructionSliderState();
}

class _InstructionSliderState extends State<InstructionSlider> {
  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      setState(() {
        _index = (_index + 1) % 5;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final List<String> texts = [
      context.loc.instructions1,
      context.loc.instructions2,
      context.loc.instructions3,
      context.loc.instructions4,
      context.loc.instructions5,
    ];
    return SizedBox(
      height: 150.h,
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween(begin: 0.95, end: 1.0).animate(animation),
                child: child,
              ),
            );
          },
          child: Text(
            texts[_index],
            key: ValueKey(_index), // VERY important
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.brownWriting,
              fontFamily: GoogleFonts.lora().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
