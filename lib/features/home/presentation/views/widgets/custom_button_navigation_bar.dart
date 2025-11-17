import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/features/home/domain/entities/button_nav_bar_entity.dart';
import 'package:timelens/features/home/presentation/views/widgets/button_nav_bar_item.dart';

class CustomButtonNavigationBar extends StatefulWidget {
  const CustomButtonNavigationBar({super.key});

  @override
  State<CustomButtonNavigationBar> createState() =>
      _CustomButtonNavigationBarState();
}

class _CustomButtonNavigationBarState extends State<CustomButtonNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290.w,
      height: 45.h,
      decoration: ShapeDecoration(
        color: AppColors.secondaryColor.withOpacity(0.9),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.r),
          topRight: Radius.circular(36.r),
        )),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: bottomNavBarItems.asMap().entries.map((e) {
            var index = e.key;
            var entity = e.value;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: ButtonNavBarItem(
                  buttonNavBarEntity: entity,
                  isSelected: selectedIndex == index),
            );
          }).toList(),
        ),
      ),
    );
  }
}
