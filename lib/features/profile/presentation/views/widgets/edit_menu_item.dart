import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/profile/presentation/views/widgets/country_drop_list.dart';
import 'package:timelens/features/profile/presentation/views/widgets/lang_drop_list.dart';

class EditMenuItem extends StatelessWidget {
  const EditMenuItem(
      {super.key, required this.title, required this.icon, required this.hint});

  final String title;
  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brownWriting,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Container(
          alignment: Alignment.center,
          width: 300.w,
          height: 35.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.primaryColor,
            ),
          ),
          child: title == context.loc.language
              ? Center(child: DropList(chosen: getLanguageIndex(hint)))
              : title == context.loc.Country
                  ? GestureDetector(
                      onTap: () => showCountryPicker(context),
                      child: SizedBox(
                        width: 300.w,
                        child: Text(
                          hint,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.brownWriting,
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: TextFormField(
                        // textAlign: TextAlign.center,
                        maxLines: 1,
                        maxLength: 40,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.brownWriting,
                        ),
                        initialValue: hint,
                        decoration: InputDecoration(
                          hintText: hint,
                          counterStyle: TextStyle(
                            backgroundColor:
                                AppColors.primaryColor.withAlpha(70),
                            fontSize: 12.sp,
                            color: AppColors.brownWriting,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 8.h,
                          ),
                          border: InputBorder.none,
                        ),
                        onSaved: (newValue) {
                          // Save the new username
                        },
                      ),
                    ),
        ),
      ],
    );
  }

  int getLanguageIndex(String language) {
    switch (language) {
      case 'en':
        return 0;
      case 'ar':
        return 1;
      case 'de':
        return 2;
      default:
        return -1; // Return -1 for unsupported languages
    }
  }
}
