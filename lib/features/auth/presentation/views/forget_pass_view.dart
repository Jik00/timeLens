import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:timelens/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:timelens/features/auth/presentation/views/widgets/forget_pass_consumer.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  static const String routeName = '/forget-pass-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPassCubit( getIt<ResetPasswordUseCase>() ),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: ForgetPassConsumer(),
      ),
    );
  }
}
