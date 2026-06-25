import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/features/auth/domain/usecases/update_password_usecase.dart';
import 'package:timelens/features/auth/presentation/cubits/update_user_pass_cubit/update_user_pass_cubit.dart';
import 'package:timelens/features/auth/presentation/views/widgets/reset_pass_consumer.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({super.key});

  static const routeName = 'reset-pass';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateUserPassCubit( getIt<UpdatePasswordUseCase>() ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        body: ResetPassConsumer(),
      ),
    );
  }
}
