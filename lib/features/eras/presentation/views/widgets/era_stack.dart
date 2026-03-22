import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/features/eras/domain/entities/era_entity.dart';
import 'package:timelens/features/eras/presentation/views/widgets/back_drop_filter.dart';
import 'package:timelens/features/eras/presentation/views/widgets/slide_to_action_button.dart';

import '../../../../../core/utils/app_colors.dart';

class EraStack extends StatelessWidget {
  const EraStack({
    super.key,
    required this.bgColor,
    required this.slideProgress,
    required this.eraEntity,
  });

  final Color? bgColor;
  final ValueNotifier<double> slideProgress;
  final EraEntity eraEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        //color: bgColor!,
        borderRadius: BorderRadius.circular(34.r),
        border: Border.all(
          width: 3,
          color: bgColor!,
        ),
      ),
      height: 240.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CachedNetworkImage(
            imageUrl: eraEntity.imageUrl,
            fit: BoxFit.fill,
            width: double.maxFinite,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: BackDropFilter(
              sigmaX: 10,
              sigmaY: 10,
              child: Text(
                eraEntity.eraPeriod,
                style: const TextStyle(
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
                title: eraEntity.eraName,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
