import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/core/services/shared_preferences_singleton.dart';
import 'package:timelens/features/home/presentation/views/widgets/custom_button_navigation_bar.dart';
import 'package:timelens/features/home/presentation/views/widgets/main_layout_body.dart';
import 'package:timelens/features/weather/domain/repo/weather_repo.dart';
import 'package:timelens/features/weather/presentation/cubits/weather_cubit/weather_cubit.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();

  static const String routeName = 'main_layout';
}

class _MainLayoutState extends State<MainLayout> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(weatherRepo: getIt.get<WeatherRepo>())
        ..getWeatherDetails(
          Prefs.getString(kLastCityKey),
        ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: CustomButtonNavigationBar(
          onItemTapped: (index) {
            setState(() {
              currentViewIndex = index;
            });
          },
        ),
        body: MainLayoutBody(currentViewIndex: currentViewIndex),
      ),
    );
  }
}
