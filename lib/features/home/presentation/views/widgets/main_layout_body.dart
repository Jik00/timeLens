import 'package:flutter/material.dart';
import 'package:timelens/core/helper_functions/ongenerate_routes.dart';
import 'package:timelens/core/services/navigation_service.dart';
import 'package:timelens/features/chatbot/presentation/views/chatbot_view.dart';
import 'package:timelens/features/home/presentation/views/home_view.dart';
import 'package:timelens/features/profile/presentation/views/profile_view.dart';
import 'package:timelens/features/weather/presentation/views/weather_view.dart';

class MainLayoutBody extends StatefulWidget {
  const MainLayoutBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  State<MainLayoutBody> createState() => _MainLayoutBodyState();
}

class _MainLayoutBodyState extends State<MainLayoutBody> {
  // navigation keys -> nested navigation stack

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.currentViewIndex,
      children: [
        // Wrapped Navigator fun to handle inside navigation stack
        HeroControllerScope(
          controller: MaterialApp.createMaterialHeroController(),
          child: _buildNavigator(0, HomeView.routeName),
        ),
        _buildNavigator(1, ChatbotView.routeName),
        _buildNavigator(2, WeatherView.routeName),
        _buildNavigator(3, ProfileView.routeName),
      ],
    );
  }

  Widget _buildNavigator(int index, String initialRoute) {
    return Navigator(
      key: tabNavigatorKeys[index], // global keys from nav service
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoutes,
    );
  }
}
