import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:timelens/core/helper_functions/dummy_figures.dart';
import 'package:timelens/core/widgets/custom_error_widget.dart';
import 'package:timelens/features/figures/presentation/cubits/get_figures_list_cubit/get_figures_list_cubit.dart';
import 'package:timelens/features/figures/presentation/views/widgets/figure_view_body.dart';

class FiguresViewBlocBuilder extends StatelessWidget {
  const FiguresViewBlocBuilder({super.key, required this.eraName});

  final String eraName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFiguresListCubit, GetFiguresListState>(
      builder: (context, state) {
        if (state is GetFiguresListSuccess) {
          return FigureViewBody(figures: state.figures);
        } else if (state is GetFiguresListFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              message: state.failure.message,
              onTap: () {
                context
                    .read<GetFiguresListCubit>()
                    .getFiguresList(eraName: eraName);
              },
            ),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: FigureViewBody(figures: dummyFigures()),
          );
        }
      },
    );
  }
}
