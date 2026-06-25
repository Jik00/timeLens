import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      this.obscure = false, this.onChanged, this.controller});

  final TextInputType textInputType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final bool obscure;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 278.w,
      child: TextFormField(
          controller: controller,
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.loc.requiredField;
            }
            return null;
          },
          obscureText: obscure,
          onChanged: onChanged,
          style: const TextStyle(color: AppColors.brownWriting),
          keyboardType: textInputType,
          decoration: InputDecoration(
            helperText: " ",
            labelText: hintText,
            labelStyle: const TextStyle(
              color: AppColors.brownWriting,
            ),
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
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w400,
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
