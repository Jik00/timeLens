import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';

class CitySearchBar extends StatelessWidget {
  const CitySearchBar({super.key, required this.controller});

  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      padding: const WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 24.0),
      ),
      leading: Icon(Icons.search, color: AppColors.brownWriting, size: 24),
      backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      overlayColor: const WidgetStatePropertyAll(AppColors.blurColor),
      hintText: context.loc.searchCity,
      hintStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 16.sp,
          color: AppColors.brownWriting,
          fontWeight: FontWeight.w600,
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
            fontSize: 16.sp,
            color: AppColors.brownWriting,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        controller.openView();
      },
    );
  }
}
