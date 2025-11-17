import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42.w,
      height: 32.h,
      child: Center(
        child: Image.asset(
          img,
          height: 24.h,
          width: 24.w,
          color: Colors.white,
        ),
      ),
    );
  }
}
