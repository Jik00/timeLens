import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:timelens/core/widgets/build_error_snack_bar.dart';
import 'package:timelens/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:timelens/features/auth/presentation/views/reset_pass_view.dart';
import 'package:timelens/features/auth/presentation/views/widgets/check_mail_alert.dart';
import 'package:timelens/features/auth/presentation/views/widgets/forget_pass_view_body.dart';

class ForgetPassConsumer extends StatelessWidget {
  const ForgetPassConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassCubit, ForgetPassState>(
      listener: (context, state) {
        if (state is ForgetPassFailure) {
          buildErrorSnackBar(context , state.error);
        } else if (state is ForgetPassSuccess) {
          CheckMailAlert.show(context, onConfirm: () {
            Navigator.popAndPushNamed(context, ResetPassView.routeName);
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgetPassLoading,
          child: const ForgetPassViewBody(),
        );
      },
    );
  }
}
