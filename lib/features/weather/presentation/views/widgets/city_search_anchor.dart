import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/weather/presentation/cubits/search_city_cubit/search_city_cubit.dart';
import 'package:timelens/features/weather/presentation/cubits/weather_cubit/weather_cubit.dart';
import 'package:timelens/features/weather/presentation/views/widgets/city_search_bar.dart';
import 'package:timelens/features/weather/presentation/views/widgets/search_suggestion_bloc_builder.dart';

class CitySearchAnchor extends StatelessWidget {
  const CitySearchAnchor({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCityCubit>();
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

            viewOnChanged: (value) {
              context.read<SearchCityCubit>().searchCity(value);
            },

            // viewOnSubmitted: (value) {
            //    context.read<WeatherCubit>().getWeatherDetails(value);
            // },

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
              minHeight: 100.h,
              maxWidth: 350.w,
            ),
            shrinkWrap: true,

            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return [
                BlocProvider.value(
                  value: searchCubit,
                  child: SearchSuggestionBlocBuilder(controller: controller),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
