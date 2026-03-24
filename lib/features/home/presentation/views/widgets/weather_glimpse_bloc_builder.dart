import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/services/shared_preferences_singleton.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/home/presentation/views/widgets/weather_glimpse.dart';
import 'package:timelens/features/weather/presentation/cubits/weather_cubit/weather_cubit.dart';

class WeatherGlimpseBlocBuilder extends StatelessWidget {
  const WeatherGlimpseBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        var lastCity = Prefs.getString(kLastCityKey);
        if (state is WeatherSuccess) {
          return WeatherGlimpse(
            city: state.weather.locationName,
            temp: state.weather.temperatureCelsius,
            condition: state.weather.conditionText,
          );
        } else {
          return WeatherGlimpse(
            city: lastCity,
            temp: '--',
            condition: context.loc.loading,
          );
        }
      }, 
    );
  }
}
