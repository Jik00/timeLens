import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/core/widgets/custom_button_navigation_bar.dart';
import 'package:timelens/features/weather/domain/repo/weather_repo.dart';
import 'package:timelens/features/weather/presentation/cubits/search_city_cubit/search_city_cubit.dart';
import 'package:timelens/features/weather/presentation/views/widgets/weather_view_body.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  static const String routeName = "weather_view";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCityCubit(
        weatherRepo: getIt.get<WeatherRepo>(),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(null),
        bottomNavigationBar: const CustomButtonNavigationBar(),
        extendBody: true,
        body: const WeatherViewBody(),
      ),
    );
  }
}
