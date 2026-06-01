import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:timelens/core/widgets/custom_error_widget.dart';
import 'package:timelens/features/auth/presentation/cubits/auth_controller/auth_controller.dart';
import 'package:timelens/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:timelens/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileConsumer extends StatelessWidget {
  const EditProfileConsumer({super.key});

  @override
  Widget build(BuildContext context) {
        return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          CustomErrorWidget(message: state.message);
        } else if (state is ProfileLoaded) {
          context.read<AuthController>().onProfileUpdated(state.profile);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ProfileLoading,
          child: const EditProfileViewBody(),
        );
      },
    );
  }
}