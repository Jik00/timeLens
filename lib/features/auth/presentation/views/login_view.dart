import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/features/auth/domain/repos/auth_repo.dart';
import 'package:timelens/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:timelens/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit( getIt<AuthRepo>() ),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
