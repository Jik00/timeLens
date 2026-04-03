import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:timelens/core/services/navigation_service.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/custom_error_widget.dart';
import 'package:timelens/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:timelens/features/home/presentation/views/main_layout.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          
          NavigationService.navigateToGlobal(MainLayout.routeName);

        }
        if (state is SignInFailure) {
          CustomErrorWidget(message: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator( color: AppColors.primaryColor,),
          inAsyncCall: state is SignInLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
