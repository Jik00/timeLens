import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.hint,
    this.onTap,
    required this.w,
    this.fillColor,
    this.borderColor,
  });

  final String hint;
  final VoidCallback? onTap;
  final int w;
  final Color? fillColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          fillColor ?? Colors.transparent,
        ),
        minimumSize: WidgetStateProperty.all(
          Size(w.w, 40.h),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: borderColor ?? Colors.white,
            ),
          ),
        ),
      ),
      child: Text(
        hint,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
