import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/features/figures/domain/entities/figure_entity.dart';
import 'package:timelens/features/figures/presentation/views/widgets/carousel_item.dart';

class FiguresSlider extends StatefulWidget {
  const FiguresSlider({super.key, required this.figures});

  final List<FigureEntity> figures;

  @override
  State<FiguresSlider> createState() => _FiguresSliderState();
}

int _currentIndex = 0;

class _FiguresSliderState extends State<FiguresSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 0,
          height: 665.h,
          viewportFraction: 0.48,
          enableInfiniteScroll: true,
          scrollPhysics: const PageScrollPhysics(),
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enlargeFactor: 0.7,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        itemCount: widget.figures.length,
        itemBuilder: (context, index, realIndex) {
          final bool isCenter = index == _currentIndex;

          return CarouselItem(
            isCenter: isCenter,
            figure: widget.figures[index],
          );
        },
      ),
    );
  }
}
