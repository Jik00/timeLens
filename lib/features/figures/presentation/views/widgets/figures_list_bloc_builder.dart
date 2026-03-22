import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:timelens/core/helper_functions/dummy_figures.dart';
import 'package:timelens/core/widgets/custom_error_widget.dart';
import 'package:timelens/features/figures/presentation/cubits/get_figures_list_cubit/get_figures_list_cubit.dart';
import 'package:timelens/features/figures/presentation/views/widgets/figures_slider.dart';

class FiguresListBlocBuilder extends StatelessWidget {
  const FiguresListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFiguresListCubit, GetFiguresListState>(
      builder: (context, state) {
        if (state is GetFiguresListSuccess) {
          return FiguresSlider(figures: state.figures);
        } else if (state is GetFiguresListFailure) {
          return CustomErrorWidget(
            message: state.failure.message,
            onTap: () {
              context
                  .read<GetFiguresListCubit>()
                  .getFiguresList();
            },
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: FiguresSlider(figures: dummyFigures()),
          );
        }
      },
    );
  }
}
