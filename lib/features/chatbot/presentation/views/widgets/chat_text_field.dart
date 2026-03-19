import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/chatbot/presentation/cubits/chatting_cubit/chatting_cubit.dart';
import 'package:timelens/features/chatbot/presentation/views/widgets/send_icon.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key});

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

final TextEditingController controller = TextEditingController();

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.assetsImagesGlass),
          //fit: BoxFit.cover,
          centerSlice: Rect.fromLTWH(20, 20, 10, 10),
        ),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: AppColors.primaryColor, width: 1.5.w),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 18.w, top: 8.h, bottom: 8.h),
        child: TextFormField(
          controller: controller,
          maxLines: 5,
          minLines: 1,
          textAlignVertical: TextAlignVertical.center,
          onChanged: (value) => setState(() {}),
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.brownWriting,
            fontFamily: GoogleFonts.lora().fontFamily,
          ),
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: context.loc.thothWhatWouldU,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: AppColors.brownWriting.withAlpha(170),
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.lora().fontFamily,
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              child: Visibility(
                visible: controller.text.isNotEmpty,
                replacement: SizedBox(
                  height: 36.h,
                ),
                child: SendIcon(
                  onSend: () {
                    context
                        .read<ChattingCubit>()
                        .addMssg(chatId: 'z', mssg: controller.text);

                    setState(() {
                      controller.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
