import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/custom_button.dart';
import 'package:timelens/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/auth/presentation/views/widgets/icon_text_field.dart';
import 'package:timelens/features/auth/presentation/views/widgets/password_field.dart';
import 'package:timelens/features/home/presentation/views/home_view.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
late String email, pass;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _LoginCardState extends State<LoginCard> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          StrokeTextCizel(
            title: context.loc.login,
            colors: const [Colors.white, Colors.white],
            titleSize: 40,
            borderColor: Colors.black,
          ),
          SizedBox(height: 20.h),
          CustomFormTextfield(
            textInputType: TextInputType.emailAddress,
            hintText: context.loc.email,
            prefixIcon: const IconTextField(img: Assets.assetsImagesIconsEmail),
            onSaved: (value) {
              email = value!;
            },
          ),
          SizedBox(height: 16.h),
          PasswordField(
            onSaved: (value) {
              pass = value!;
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomButton(
            hint: context.loc.login,
            w: 173,
            borderColor: AppColors.primaryColor.withOpacity(0.6),
            fillColor: AppColors.primaryColor.withOpacity(0.75),
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                //////////////// backend login ///////////////////////
                //
                Navigator.pushReplacementNamed(context, HomeView.routeName);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          SizedBox(
            height: 14.h,
          ),
          StrokeTextCizel(
            title: context.loc.forgetPass,
            colors: const [Colors.white, Colors.white],
            titleSize: 15,
            borderColor: AppColors.secondaryColor,
            textDecoration: TextDecoration.underline,
          )
        ],
      ),
    );
  }
}
