import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/features/home/domain/entities/era_entity.dart';
import 'package:timelens/features/home/presentation/views/widgets/era_card.dart';

class EraListview extends StatelessWidget {
  const EraListview({super.key, required this.eras});

  final List<EraEntity> eras;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: EraCard(
              eraEntity: eras[index],
            ),
          );
        },
        childCount: eras.length,
      ),
    );
  }
}
