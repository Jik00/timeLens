import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/test/back_drop_filter.dart';
import 'package:timelens/features/test/slide_to_action_button.dart';

class EraStack extends StatelessWidget {
  const EraStack({
    super.key,
    required this.bgColor,
    required this.slideProgress,
  });

  final Color? bgColor;
  final ValueNotifier<double> slideProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 2,
          color: bgColor!,
        ),
      ),
      height: 240,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            Assets.assetsImagesEraPhoto,
            fit: BoxFit.fill,
            width: double.maxFinite,
          ),
          const Positioned(
            top: 16,
            left: 16,
            child: BackDropFilter(
              sigmaX: 10,
              sigmaY: 10,
              child: Text(
                "( 1500 - 1300 BC )",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 35,
            child: BackDropFilter(
              sigmaX: 8,
              sigmaY: 8,
              child: SlideToActionButton(
                progressNotifier: slideProgress,
              ),
            ),
          ),
        ],
      ),
    );
  }
}