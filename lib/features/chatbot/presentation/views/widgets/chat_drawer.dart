import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/auth/presentation/cubits/auth_controller/auth_controller.dart';
import 'package:timelens/features/chatbot/presentation/cubits/chatting_cubit/chatting_cubit.dart';
import 'package:timelens/features/chatbot/presentation/cubits/fetch_chats_cubit/fetch_chats_cubit.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/chats_history_bloc_consumer.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/drawer_item.dart';

class ChatDrawer extends StatelessWidget {
  const ChatDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24.r),
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
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();

                      context.read<ChattingCubit>().reset();
                    },
                    child: DrawerItem(),
                  ),
                  Divider(
                    color: AppColors.primaryColor.withAlpha(150),
                    thickness: 1.5.w,
                    indent: 24.w,
                    endIndent: 24.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.loc.prevChats,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.brownWriting,
                          fontFamily: GoogleFonts.lora().fontFamily,
                        ),
                      ),
                      SizedBox(width: 28.w),
                      IconButton(
                        onPressed: () {
                          context.read<FetchChatsCubit>().getChats(
                              context.read<AuthController>().userId ??
                                  'testUserId',
                              forceRefresh: true);
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.primaryColor.withAlpha(150),
                    thickness: 1.5.w,
                    indent: 24.w,
                    endIndent: 24.w,
                  ),
                  SizedBox(
                    height: 350.h,
                    child: ChatsHistoryBlocConsumer(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
