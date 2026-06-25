import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/build_error_snack_bar.dart';
import 'package:timelens/core/widgets/custom_button.dart';
import 'package:timelens/features/auth/presentation/cubits/update_user_pass_cubit/update_user_pass_cubit.dart';
import 'package:timelens/features/auth/presentation/views/widgets/password_field.dart';

class ResetPassColumn extends StatefulWidget {
  const ResetPassColumn({super.key});

  @override
  State<ResetPassColumn> createState() => _ResetPassColumnState();
}

class _ResetPassColumnState extends State<ResetPassColumn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController pass1, pass2;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    pass1 = TextEditingController();
    pass2 = TextEditingController();
  }

  @override
  void dispose() {
    pass1.dispose();
    pass2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          PasswordField(
            controller: pass1,
          ),
          SizedBox(height: 12.h),
          PasswordField(
            hint: context.loc.confirmPassword,
            controller: pass2,
          ),
          SizedBox(height: 20.h),
          CustomButton(
            hintSize: 18.sp,
            hint: context.loc.resetPassword,
            onTap: () {
              if (_formKey.currentState!.validate() &&
                  pass1.text == pass2.text) {
                debugPrint(
                    "pass1: ${pass1.text}, pass2: ${pass2.text} + MATCH");

                _formKey.currentState!.save();
                context.read<UpdateUserPassCubit>().updatePassword( pass1.text);

              } else {
                debugPrint("pass1: ${pass1.text}, pass2: ${pass2.text} + NO MATCH");
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                  if (pass1.text != pass2.text) {
                    buildErrorSnackBar(context, context.loc.passwordsDontMatch);
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
