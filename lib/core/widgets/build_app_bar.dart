import 'package:flutter/material.dart';

AppBar buildAppBar(Color backgroundColor, Widget? titleWidget) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    title: titleWidget,
    foregroundColor: Colors.white,
  );
}
