import 'package:flutter/material.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.message,   this.onTap});

  final String message;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error: $message'),
          const SizedBox(height: 16),
          CustomButton(hint: context.loc.retry, w: 173, onTap: () {}),
        ],
      ),
    );
  }
}
