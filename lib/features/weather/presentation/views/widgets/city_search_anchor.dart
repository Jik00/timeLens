import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/auth/presentation/views/widgets/back_drop_filter.dart';
import 'package:timelens/features/weather/presentation/views/widgets/city_search_bar.dart';
import 'package:timelens/features/weather/presentation/views/widgets/search_list_tile.dart';

class CitySearchAnchor extends StatefulWidget {
  const CitySearchAnchor({super.key});

  @override
  State<CitySearchAnchor> createState() => _CitySearchAnchorState();
}

class _CitySearchAnchorState extends State<CitySearchAnchor> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: Stack(
        children: [
          Image.asset(
            Assets.assetsImagesSearchBar,
            width: 350.w,
            fit: BoxFit.fill,
          ),
          SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return CitySearchBar(controller: controller);
            },
            dividerColor: AppColors.blurColor,
            viewPadding: EdgeInsets.zero,
            // viewBarPadding: EdgeInsets.symmetric(vertical: 8.h),
            isFullScreen: false,
            viewBackgroundColor: AppColors.primaryColor.withAlpha(100),
            viewElevation: 4,
            viewShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            viewConstraints: BoxConstraints(
              maxWidth: 350.w,
              maxHeight: 300.h,
            ),
            shrinkWrap: true,
            viewBuilder: (suggestions) {
              return Center(
                child: AnimatedOpacity(
                  opacity: 1,
                  duration: Duration(milliseconds: 300),
                  // child:
                ),
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<SearchListTile>.generate(
                1,
                (int index) {
                  // final String item = 'item $index';
                  return SearchListTile();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
