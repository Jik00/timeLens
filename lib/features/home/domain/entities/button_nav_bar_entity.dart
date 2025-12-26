import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/home/presentation/views/home_view.dart';

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
          routeName: HomeView.routeName),
      ButtomNavBarEntity(
          name: 'Chatbot',
          activeImg: Assets.assetsImagesIconsChatbotFill,
          inActiveImg: Assets.assetsImagesIconsChatbot,
          routeName: HomeView.routeName),
      ButtomNavBarEntity(
          name: 'Web',
          activeImg: Assets.assetsImagesIconsWebFill,
          inActiveImg: Assets.assetsImagesIconsWeb,
          routeName: HomeView.routeName),
      ButtomNavBarEntity(
          name: 'Profile',
          activeImg: Assets.assetsImagesIconsUserFill,
          inActiveImg: Assets.assetsImagesIconsUser,
          routeName: HomeView.routeName),
    ];
