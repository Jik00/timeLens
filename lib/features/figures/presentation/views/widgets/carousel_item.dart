import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/figures/domain/entities/figure_entity.dart';
import 'package:timelens/features/figures/presentation/views/display_detail_view.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key, required this.isCenter, required this.figure});

  final bool isCenter;
  final FigureEntity figure;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if (isCenter) {
              Navigator.pushNamed(context, DisplayDetailView.routeName,
                  arguments: figure);
            }
          },
          child: isCenter
              ? Hero(
                  tag: kHeroTagImg,
                  createRectTween: (begin, end) {
                    return MaterialRectArcTween(begin: begin, end: end);
                  },
                  child: CachedNetworkImage(
                    imageUrl: figure.imageUrl,
                    fit: BoxFit.fill,
                    height: 390.h,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                )
              : Opacity(
                  opacity: 0.6,
                  child: CachedNetworkImage(
                    imageUrl: figure.imageUrl,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    //width: 300.w,
                    height: 390.h,
                  ),
                ),
        ),
        SizedBox(height: 120.h),
        Visibility(
          visible: isCenter,
          child: Hero(
            tag: kHeroTagName,
            child: StrokeTextCizel(
              title: figure.figureName,
              colors: const [AppColors.timeLensColor, Colors.white],
              titleSize: 41,
              borderColor: AppColors.brownWriting,
            ),
          ),
        ),
      ],
    );
  }
}
