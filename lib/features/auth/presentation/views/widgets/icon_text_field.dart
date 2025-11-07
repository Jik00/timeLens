import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTextField extends StatelessWidget {
  const IconTextField({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Image.asset(
        img,
        color: Colors.white,
        width: 18.w,
        height: 18.h,
      ),
    );
  }
}
