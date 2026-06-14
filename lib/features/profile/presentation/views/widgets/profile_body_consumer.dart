import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:timelens/core/widgets/custom_error_widget.dart';
import 'package:timelens/features/auth/presentation/views/login_view.dart';
import 'package:timelens/features/home/presentation/views/main_layout.dart';
import 'package:timelens/features/profile/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:timelens/features/profile/presentation/views/widgets/edit_profile_body_consumer.dart';

class ProfileBodyConsumer extends StatelessWidget {
  const ProfileBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutFailure) {
          CustomErrorWidget(message: state.message);
        } else if (state is LogoutSuccess) {
          // Navigator.popUntil(
          //   context,
          //   (route) => route.settings.name == MainLayout.routeName,
          // );
          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   LoginView.routeName,
          //   (route) => false,
          // );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LogoutLoading,
          child: const EditProfileBodyConsumer(),
        );
      },
    );
  }
}
