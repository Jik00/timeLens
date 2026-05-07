import 'dart:async';

import 'package:timelens/constants.dart';
import 'package:timelens/core/services/shared_preferences_singleton.dart';
import 'package:timelens/features/auth/presentation/cubits/auth_controller/auth_controller.dart';
import 'package:timelens/features/auth/presentation/views/login_view.dart';
import 'package:timelens/features/home/presentation/views/main_layout.dart';
import 'package:timelens/features/onboarding/presentation/views/onboarding_view.dart';

class SplashNavManager {
  final AuthController _authController;

  static const minDisplayDuration = Duration(seconds: 4);

  SplashNavManager(this._authController);

  Future<String> determineNextRoute() async {
    await Future.delayed(minDisplayDuration);

    final isOnboardingSeen = Prefs.getBool(kIsOnboardingSeen);
    if (!isOnboardingSeen) return OnboardingView.routeName;

    // Wait for auth to resolve if still unknown
    if (_authController.isUnknown) {
      await _waitForAuthResolution();
    }

    return _authController.isAuthenticated
        ? MainLayout.routeName
        : LoginView.routeName;
  }

  Future<void> _waitForAuthResolution() async {
    final completer = Completer<void>();

    void listener() {
      if (!_authController.isUnknown) {
        _authController.removeListener(listener);
        completer.complete();
      }
    }

    _authController.addListener(listener);
    return completer.future;
  }
}

