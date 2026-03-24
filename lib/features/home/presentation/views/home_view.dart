import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/core/services/shared_preferences_singleton.dart';
import 'package:timelens/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:timelens/features/weather/domain/repo/weather_repo.dart';
import 'package:timelens/features/weather/presentation/cubits/weather_cubit/weather_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
        body: const HomeViewBody(),
      ),
    );
  }
}
