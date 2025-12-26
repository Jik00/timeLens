import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';

class CustomFormTextfield extends StatelessWidget {
  const CustomFormTextfield(
      {super.key,
      required this.textInputType,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.onSaved,
      this.obscure = false});

  final TextInputType textInputType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 278.w,
      child: TextFormField(
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.loc.requiredField;
            }
            return null;
          },
          obscureText: obscure,
          style: const TextStyle(color: Colors.white),
          keyboardType: textInputType,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: TextStyle(
                color: Colors.white, fontFamily: GoogleFonts.lora().fontFamily),
            floatingLabelStyle: const TextStyle(),
            errorStyle: const TextStyle(color: Colors.red),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.lora().fontFamily,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: Colors.transparent,
            enabled: true,
            enabledBorder: buildBorder(),
            border: buildBorder(),
          )),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.primaryColor,
      ),
    );
  }
}
