import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/generated/l10n.dart';

class DropList extends StatefulWidget {
  const DropList({super.key, required this.chosen});

  final int chosen;

  @override
  State<DropList> createState() => _DropListState();
}

class _DropListState extends State<DropList> {
  late int selectedIndex;

  final List<String> languages = [
    S.current.englishCode,
    S.current.arabicCode,
    S.current.germanCode
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.chosen;
  }

  @override
  void didUpdateWidget(covariant DropList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update if the parent widget changes the chosen value
    if (oldWidget.chosen != widget.chosen) {
      selectedIndex = widget.chosen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      elevation: 0,
      alignment: AlignmentDirectional.bottomStart,
      isExpanded: true,
      underline: SizedBox(height: 0.h),
      menuWidth: 300.w,
      dropdownColor: AppColors.blurColor,
      borderRadius: BorderRadius.circular(12.r),
      value: selectedIndex != -1 ? selectedIndex : null,
      selectedItemBuilder: (context) => List.generate(
        languages.length,
        (index) => Center(
          child: Text(
            languages[index],
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.brownWriting,
            ),
          ),
        ),
      ),
      items: List.generate(
        languages.length,
        (index) => DropdownMenuItem(
          value: index,
          child: Center(
            child: Text(
              languages[index],
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.brownWriting,
              ),
            ),
          ),
        ),
      ),
      icon:
          const Icon(Icons.keyboard_arrow_down, color: AppColors.brownWriting),
      onChanged: (newValue) {
        setState(() {
          selectedIndex = newValue!;
        });
      },
    );
  }
}
