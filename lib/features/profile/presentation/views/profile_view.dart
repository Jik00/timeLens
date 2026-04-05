import 'package:flutter/material.dart';
import 'package:timelens/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const String routeName = 'profile_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileViewBody(),
      extendBody: true,
    );
  }
}
