import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:timelens/core/widgets/build_error_snack_bar.dart';
import 'package:timelens/features/auth/presentation/cubits/update_user_pass_cubit/update_user_pass_cubit.dart';
import 'package:timelens/features/auth/presentation/views/widgets/reset_pass_view_body.dart';

class ResetPassConsumer extends StatelessWidget {
  const ResetPassConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserPassCubit, UpdateUserPassState>(
      listener: (context, state) {
        if (state is UpdateUserPassSuccess) {
          Navigator.pop(context);
        } else if (state is UpdateUserPassFailure) {
          buildErrorSnackBar(context,  state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateUserPassLoading,
          child: const ResetPassViewBody());
      },
    );
  }
}
