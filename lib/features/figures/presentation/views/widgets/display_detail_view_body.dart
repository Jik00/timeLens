import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_images.dart';
//import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/figures/presentation/views/widgets/details_column.dart';

class DisplayDetailViewBody extends StatelessWidget {
  const DisplayDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DetailsColumn(),
        Positioned(
          right: 10.w,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
              tag: kHeroTagImg,
              child: Image.asset(
                Assets.assetsImagesRamses2Statue,
                width: 160.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
