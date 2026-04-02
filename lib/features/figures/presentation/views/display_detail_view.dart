import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/features/figures/domain/entities/figure_entity.dart';
import 'package:timelens/features/figures/presentation/views/widgets/display_detail_view_body.dart';

class DisplayDetailView extends StatelessWidget {
  const DisplayDetailView({super.key, required this.figure});

  static const String routeName = 'displayDetailView';

  final FigureEntity figure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(
        Text(
          context.loc.moreAbout,
          style: TextStyle(
              fontSize: 18, fontFamily: GoogleFonts.lora().fontFamily),
        ),
      ),
      extendBody: true,
      body: DisplayDetailViewBody( figure: figure),
    );
  }
}
