import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/custom_error_widget.dart';
import 'package:timelens/features/weather/presentation/cubits/search_city_cubit/search_city_cubit.dart';
import 'package:timelens/features/weather/presentation/views/widgets/search_list_tile.dart';

class SearchSuggestionBlocBuilder extends StatelessWidget {
  const SearchSuggestionBlocBuilder({super.key, required this.controller});

  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCityCubit, SearchCityState>(
      builder: (context, state) {
        if (state is SearchCityLoading) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          );
        } else if (state is SearchCityFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CustomErrorWidget(message: state.message),
            ),
          );
        } else if (state is SearchCitySuccess) {
          if (state.cities.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  context.loc.noCitiesFound,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }
          return SizedBox(
            height: 400.h,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 8),
              itemCount: state.cities.length,
              itemBuilder: (context, index) {
                final city = state.cities[index];
                return SearchListTile(
                  location: city,
                  onTap: () {
                    controller.closeView(city.locationName);
                  },
                );
              },
            ),
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                context.loc.enterCityName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
