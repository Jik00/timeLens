import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/features/figures/presentation/views/widgets/carousel_item.dart';

class FiguresSlider extends StatefulWidget {
  const FiguresSlider({super.key});

  @override
  State<FiguresSlider> createState() => _FiguresSliderState();
}

int _currentIndex = 0;

class _FiguresSliderState extends State<FiguresSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        //autoPlay: true,
        height: 500.h,
        viewportFraction: 0.7,
        enableInfiniteScroll: true,
        scrollPhysics: const BouncingScrollPhysics(),
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enlargeFactor: 0.75,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        final bool isCenter = index == _currentIndex;

        return CarouselItem(
          isCenter: isCenter,
        );
      },
    );
  }
}
