import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/core/widgets/custom_button_navigation_bar.dart';
import 'package:timelens/features/figures/presentation/views/widgets/display_detail_view_body.dart';

class DisplayDetailView extends StatelessWidget {
  const DisplayDetailView({super.key});

  static const String routeName = 'displayDetailView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          AppColors.blackBackground,
          Text(
            'More About ...',
            style: TextStyle(
                fontSize: 18, fontFamily: GoogleFonts.lora().fontFamily),
          )),
      backgroundColor: AppColors.blackBackground,
      bottomNavigationBar: const CustomButtonNavigationBar(),
      body: const DisplayDetailViewBody(),
    );
  }
}
