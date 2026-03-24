import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:timelens/features/weather/presentation/cubits/weather_cubit/weather_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<WeatherCubit>(),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: const HomeViewBody(),
      ),
    );
  }
}
