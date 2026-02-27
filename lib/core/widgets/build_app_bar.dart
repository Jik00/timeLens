import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_colors.dart';

AppBar buildAppBar(Color backgroundColor, Widget? titleWidget) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    title: titleWidget,
    foregroundColor: AppColors.brownWriting,
    forceMaterialTransparency: true,
  );
}
