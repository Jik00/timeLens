import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  // Navigate to a route that REPLACES the current screen (removes bottom nav)
  static void navigateToGlobal(String routeName, {dynamic arguments}) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
  
  // Navigate to a route and add to stack (removes bottom nav)
  static void pushGlobal(String routeName, {dynamic arguments}) {
    navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }
  
  // Pop the current route
  static void popGlobal() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
    }
  }
  
  // Navigate to a route that keeps bottom nav (using context)
  static void navigateWithinTab(BuildContext context, String routeName, {dynamic arguments}) {
    Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }
}