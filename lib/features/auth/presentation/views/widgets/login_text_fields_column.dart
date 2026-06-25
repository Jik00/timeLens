import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/custom_button.dart';
import 'package:timelens/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:timelens/features/auth/presentation/views/forget_pass_view.dart';
import 'package:timelens/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:timelens/features/auth/presentation/views/widgets/icon_text_field.dart';
import 'package:timelens/features/auth/presentation/views/widgets/password_field.dart';

class LoginTextFieldsColumn extends StatefulWidget {
  const LoginTextFieldsColumn({super.key});

  @override
  State<LoginTextFieldsColumn> createState() => _LoginTextFieldsColumnState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
late String email, pass;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _LoginTextFieldsColumnState extends State<LoginTextFieldsColumn> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormTextfield(
            textInputType: TextInputType.emailAddress,
            hintText: context.loc.email,
            prefixIcon: const IconTextField(img: Assets.assetsImagesIconsEmail),
            onSaved: (value) {
              email = value!;
            },
          ),
          SizedBox(height: 12.h),
          PasswordField(
            onSaved: (value) {
              pass = value!;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ForgetPassView.routeName);
            },
            child: Text(
              context.loc.forgetPass,
              style: TextStyle(
                color: AppColors.brownWriting.withAlpha(179),
                fontSize: 18.sp,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.brownWriting.withAlpha(179),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomButton(
            hint: context.loc.login,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context
                    .read<SignInCubit>()
                    .signInWithEmailAndPassword(email: email, password: pass);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
