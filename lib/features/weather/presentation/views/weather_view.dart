import 'package:flutter/material.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/core/widgets/custom_button_navigation_bar.dart';
import 'package:timelens/features/weather/presentation/views/widgets/weather_view_body.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  static const String routeName = "weather_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(null),
      bottomNavigationBar: const CustomButtonNavigationBar(),
      extendBody: true,
      body: const WeatherViewBody(),
    );
  }
}
