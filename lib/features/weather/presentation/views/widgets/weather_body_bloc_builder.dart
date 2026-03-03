import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/custom_error_widget.dart';
import 'package:timelens/features/weather/presentation/cubits/weather_cubit/weather_cubit.dart';
import 'package:timelens/features/weather/presentation/views/widgets/weather_card.dart';

class WeatherBodyBlocBuilder extends StatelessWidget {
  const WeatherBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        } else if (state is WeatherFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CustomErrorWidget(message: state.message),
            ),
          );
        } else if (state is WeatherSuccess) {
          return WeatherCard(weatherEntity: state.weather);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
