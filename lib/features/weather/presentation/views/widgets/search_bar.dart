import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/auth/presentation/views/widgets/back_drop_filter.dart';
import 'package:timelens/features/weather/presentation/views/widgets/search_list_tile.dart';

class CitySearchBar extends StatefulWidget {
  const CitySearchBar({super.key});

  @override
  State<CitySearchBar> createState() => _CitySearchBarState();
}

class _CitySearchBarState extends State<CitySearchBar> {
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
              return SearchBar(
                controller: controller,
                keyboardType: TextInputType.name,
                hintText: context.loc.searchCity,
                leading:
                    Icon(Icons.search, color: AppColors.brownWriting, size: 24),
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 24.0),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                shadowColor: const WidgetStatePropertyAll(Colors.transparent),
                overlayColor: const WidgetStatePropertyAll(AppColors.blurColor),
                textStyle: WidgetStatePropertyAll(
                  TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.brownWriting,
                      fontWeight: FontWeight.bold),
                ),
                hintStyle: WidgetStatePropertyAll(
                  TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.brownWriting,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
              );
            },
            viewBackgroundColor: Colors.transparent,
            viewSurfaceTintColor: Colors.white,
            viewElevation: 4,
            isFullScreen: false,
            shrinkWrap: true,
            viewBuilder: (suggestions) {
              return Center(
                child: AnimatedOpacity(
  opacity: 1,
  duration: Duration(milliseconds: 300),

  child: BackDropFilter(),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   height: MediaQuery.of(context).size.height * 0.6,
                //   padding: const EdgeInsets.all(16),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(24),
                //     border: Border.all(color: AppColors.primaryColor, width: 2),
                //   ),
                // ),
              ),);
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
