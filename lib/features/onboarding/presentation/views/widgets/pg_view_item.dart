import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/background_theme.dart';

class PgViewItem extends StatelessWidget {
  const PgViewItem(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle});

  final String img;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        BackgroundTheme(img: img),

        Positioned(
          bottom: 100.h,
          left: 16.w,
          right: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 8.r,
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                subtitle,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.lora().fontFamily,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
