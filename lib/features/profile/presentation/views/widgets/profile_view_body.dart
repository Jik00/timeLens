import 'package:flutter/widgets.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/widgets/background_with_top_frame.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: const BackgroundWithTopFrame(
        img: Assets.assetsImagesTopFrame,
      ),
    );
  }
}
