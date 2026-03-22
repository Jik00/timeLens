import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/figures/domain/entities/figure_entity.dart';
import 'package:timelens/features/figures/presentation/views/widgets/details_column.dart';

class DisplayDetailViewBody extends StatelessWidget {
  const DisplayDetailViewBody({super.key, required this.figure});

  final FigureEntity figure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.assetsImagesBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 85.h,
            right: 10.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Hero(
                tag: kHeroTagImg,
                child: CachedNetworkImage(
                  imageUrl: figure.imageUrl,
                  width: 175.w,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          DetailsColumn( figure: figure),
        ],
      ),
    );
  }
}
