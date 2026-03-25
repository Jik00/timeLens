import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/services/navigation_service.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/chatbot/presentation/views/chatbot_view.dart';
import 'package:timelens/features/weather/presentation/views/widgets/city_name_container.dart';
class ChatbotCard extends StatelessWidget {
  const ChatbotCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  => NavigationService.pushGlobal( ChatbotView.routeName),
      child: SizedBox(
        height: 315.h,
        width: 332.w,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.assetsImagesChatbot,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: CityNameContainer(
                cityName: context.loc.chatWithThoth,
                icon: Assets.assetsImagesSunIcon,
              ),
            ),
            Positioned(
              bottom: -10.h,
              top: 5.h,
              child: Transform.scale(
                scaleY: 1.25,
                scaleX: 1.05,
                child: Image.asset(
                  Assets.assetsImagesSquareFrame,
                  width: 330.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
