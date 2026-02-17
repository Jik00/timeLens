import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/custom_button.dart';
import 'package:timelens/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:timelens/features/auth/presentation/views/widgets/icon_text_field.dart';
import 'package:timelens/features/auth/presentation/views/widgets/password_field.dart';

import '../../../../home/presentation/views/home_view.dart';

class TextFieldsColumn extends StatefulWidget {
  const TextFieldsColumn({super.key});

  @override
  State<TextFieldsColumn> createState() => _TextFieldsColumnState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
late String email, pass;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _TextFieldsColumnState extends State<TextFieldsColumn> {
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
          SizedBox(height: 16.h),
          PasswordField(
            onSaved: (value) {
              pass = value!;
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            context.loc.forgetPass,
            style: TextStyle(
              color: AppColors.brownWriting.withOpacity(0.7),
              fontSize: 18.sp,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          CustomButton(
            hint: context.loc.login,
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
        ],
      ),
    );
  }
}
