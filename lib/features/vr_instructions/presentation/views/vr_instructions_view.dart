import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/features/vr_instructions/presentation/views/widgets/vr_instructions_view_body.dart';

class VrInstructionsView extends StatelessWidget {
  const VrInstructionsView({super.key});

  static const String routeName = 'vr-instructions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(
        Text(
          context.loc.instructions,
          style: TextStyle(
            fontSize: 18,
            fontFamily: GoogleFonts.lora().fontFamily,
          ),
        ),
      ),
      body: const VrInstructionsViewBody(),
    );
  }
}
