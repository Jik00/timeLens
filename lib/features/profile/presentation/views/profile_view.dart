import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/features/auth/domain/repos/auth_repo.dart';
import 'package:timelens/features/profile/domain/repo/profile_repo.dart';
import 'package:timelens/features/profile/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:timelens/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:timelens/features/profile/presentation/views/widgets/profile_body_consumer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const String routeName = 'profile_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(profileRepo: getIt<ProfileRepo>()),
        ),
        BlocProvider(
          create: (context) => LogoutCubit(authRepo: getIt<AuthRepo>()),
        ),
      ],
      child: Scaffold(
        body: ProfileBodyConsumer(),
        extendBody: true,
      ),
    );
  }
}
