import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/drawer_item.dart';

class ChatDrawer extends StatelessWidget {
  const ChatDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.assetsImagesBackground,
              fit: BoxFit.cover,
            ),
          ),
          // Positioned.fill(
          //   child: BackDropFilter(),
          // ),

          Align(
            alignment: AlignmentGeometry.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 75.h),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage:
                        const AssetImage(Assets.assetsImagesHourGlass),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    context.loc.thoth,
                    style: TextStyle(
                      fontSize: 32.sp,
                      color: AppColors.brownWriting,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    context.loc.thothAskAbout,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.brownWriting.withAlpha(150),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.lora().fontFamily,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Divider(
                    color: AppColors.primaryColor.withAlpha(150),
                    thickness: 1.5.w,
                    indent: 24.w,
                    endIndent: 24.w,
                  ),
                  SizedBox(height: 8.h),
                  DrawerItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
