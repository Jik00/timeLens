import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/eras/presentation/views/eras_view.dart';

class ButtomNavBarEntity {
  final String activeImg, inActiveImg, name, routeName;

  ButtomNavBarEntity(
      {required this.name,
      required this.activeImg,
      required this.inActiveImg,
      required this.routeName});
}

List<ButtomNavBarEntity> get bottomNavBarItems => [
      ButtomNavBarEntity(
          name: 'Home',
          activeImg: Assets.assetsImagesIconsHomeFill,
          inActiveImg: Assets.assetsImagesIconsHome,
          routeName: ErasView.routeName),
      ButtomNavBarEntity(
          name: 'Chatbot',
          activeImg: Assets.assetsImagesIconsChatbotFill,
          inActiveImg: Assets.assetsImagesIconsChatbot,
          routeName: ErasView.routeName),
      ButtomNavBarEntity(
          name: 'Web',
          activeImg: Assets.assetsImagesIconsWebFill,
          inActiveImg: Assets.assetsImagesIconsWeb,
          routeName: ErasView.routeName),
      ButtomNavBarEntity(
          name: 'Profile',
          activeImg: Assets.assetsImagesIconsUserFill,
          inActiveImg: Assets.assetsImagesIconsUser,
          routeName: ErasView.routeName),
    ];
