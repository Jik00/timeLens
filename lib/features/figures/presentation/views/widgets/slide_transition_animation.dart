import 'package:flutter/material.dart';

class SlideTransitionAnimation extends StatefulWidget {
  const SlideTransitionAnimation({super.key, required this.child});

  @override
  State<SlideTransitionAnimation> createState() =>
      _SlideTransitionAnimationState();

  final Widget child;
}

class _SlideTransitionAnimationState extends State<SlideTransitionAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 950),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}
