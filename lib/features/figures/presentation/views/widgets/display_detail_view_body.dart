import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/figures/presentation/views/widgets/details_column.dart';

class DisplayDetailViewBody extends StatelessWidget {
  const DisplayDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Stack(
        clipBehavior: Clip.none,
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
                child: Material(
                  color: Colors.transparent,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF91896B).withOpacity(0.45),
                          blurRadius: 60.r,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      Assets.assetsImagesRamses2Statue,
                      width: 175.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
