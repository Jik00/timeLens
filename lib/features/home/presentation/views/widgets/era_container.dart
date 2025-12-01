import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/home/domain/entities/era_entity.dart';

class EraContainer extends StatelessWidget {
  const EraContainer({super.key, required this.eraEntity});

  final EraEntity eraEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 320.w,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(34),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          StrokeTextCizel(
              title: eraEntity.eraName,
              colors: const [Colors.white, Colors.white],
              titleSize: 16,
              borderColor: AppColors.primaryColor),
          SizedBox(
            height: 8.h,
          ),
          Container(
            width: 300.w,
            height: 297.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
            ),
            child: CachedNetworkImage(
              imageUrl: eraEntity.imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Transform.translate(
            offset: const Offset(80, 0),
            child: StrokeTextCizel(
                title: eraEntity.eraPeriod,
                colors: const [Colors.white, Colors.white],
                titleSize: 14,
                borderColor: AppColors.primaryColor),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
