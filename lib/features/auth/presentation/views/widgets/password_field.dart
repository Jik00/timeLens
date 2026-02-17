import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:timelens/features/auth/presentation/views/widgets/icon_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

bool obscure = true;

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return CustomFormTextfield(
      obscure: obscure,
      textInputType: TextInputType.visiblePassword,
      hintText: context.loc.password,
      onSaved: widget.onSaved,
      prefixIcon: const IconTextField(img: Assets.assetsImagesIconsPadlock),
      suffixIcon: IconButton(
        onPressed: () => setState(() => obscure = !obscure),
        icon: Icon(obscure ? Icons.visibility_off : Icons.remove_red_eye),
        color: AppColors.primaryColor,
      ),
    );
  }
}
