import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/features/auth/presentation/cubits/auth_controller/auth_controller.dart';
import 'package:timelens/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (_) => getIt<AuthController>(),
      child: const Scaffold(
        body: SplashViewBody(),
      ),
    );
  }
}
