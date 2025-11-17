import 'package:timelens/core/utils/app_images.dart';

class ButtomNavBarEntity {
  final String activeImg, inActiveImg, name;

  ButtomNavBarEntity(
      {required this.name, required this.activeImg, required this.inActiveImg});
}

List<ButtomNavBarEntity> get bottomNavBarItems => [
      ButtomNavBarEntity(
          name: 'Home',
          activeImg: Assets.assetsImagesIconsHomeFill,
          inActiveImg: Assets.assetsImagesIconsHome),
      ButtomNavBarEntity(
          name: 'Chatbot',
          activeImg: Assets.assetsImagesIconsChatbotFill,
          inActiveImg: Assets.assetsImagesIconsChatbot),
      ButtomNavBarEntity(
          name: 'Web',
          activeImg: Assets.assetsImagesIconsWebFill,
          inActiveImg: Assets.assetsImagesIconsWeb),
      ButtomNavBarEntity(
          name: 'Profile',
          activeImg: Assets.assetsImagesIconsUserFill,
          inActiveImg: Assets.assetsImagesIconsUser)
    ];
