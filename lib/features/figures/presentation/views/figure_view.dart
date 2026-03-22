import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/core/widgets/custom_button_navigation_bar.dart';
import 'package:timelens/features/figures/domain/repos/figure_repo.dart';
import 'package:timelens/features/figures/presentation/cubits/get_figures_list_cubit/get_figures_list_cubit.dart';
import 'package:timelens/features/figures/presentation/views/widgets/figures_view_body.dart';

class FigureView extends StatelessWidget {
  const FigureView({super.key, required this.eraName});

  static const routeName = 'figure';
  final String eraName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFiguresListCubit(
        figureRepo: getIt.get<FigureRepo>(),
        eraName: eraName,
      )..getFiguresList(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(null),
        bottomNavigationBar: const CustomButtonNavigationBar(),
        extendBody: true,
        body: const FiguresViewBody(),
      ),
    );
  }
}
