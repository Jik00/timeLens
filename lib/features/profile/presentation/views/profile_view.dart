import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/features/profile/domain/repo/profile_repo.dart';
import 'package:timelens/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:timelens/features/profile/presentation/views/widgets/profile_body_consumer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const String routeName = 'profile_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(profileRepo: getIt<ProfileRepo>()),
      child: Scaffold(
        body: ProfileBodyConsumer(),
        extendBody: true,
      ),
    );
  }
}
