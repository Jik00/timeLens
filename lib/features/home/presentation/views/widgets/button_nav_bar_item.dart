import 'package:flutter/material.dart';
import 'package:timelens/features/home/domain/entities/button_nav_bar_entity.dart';
import 'package:timelens/features/home/presentation/views/widgets/active_nav_bar_item.dart';
import 'package:timelens/features/home/presentation/views/widgets/inactive_nav_bar_item.dart';

class ButtonNavBarItem extends StatelessWidget {
  const ButtonNavBarItem(
      {super.key, required this.buttonNavBarEntity, required this.isSelected});

  final ButtomNavBarEntity buttonNavBarEntity;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(img: buttonNavBarEntity.activeImg)
        : InActiveItem(img: buttonNavBarEntity.inActiveImg);
  }
}



