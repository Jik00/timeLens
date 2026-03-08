import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_colors.dart';

AppBar buildAppBar(Widget? titleWidget) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: titleWidget,
    foregroundColor: AppColors.brownWriting,
    forceMaterialTransparency: true,
  );
}
