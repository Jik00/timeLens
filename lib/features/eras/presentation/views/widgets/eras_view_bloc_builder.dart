import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:timelens/core/helper_functions/dummy_eras.dart';
import 'package:timelens/core/widgets/custom_error_widget.dart';
import 'package:timelens/features/eras/presentation/cubits/get_eras_cubit/get_eras_list_cubit.dart';
import 'package:timelens/features/eras/presentation/views/widgets/era_listview.dart';

class ErasViewBlocBuilder extends StatelessWidget {
  const ErasViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetErasListCubit, GetErasListState>(
      builder: (context, state) {
        if (state is GetErasListSuccess) {
          return EraListview(eras: state.eras);
        } else if (state is GetErasListFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              message: state.message,
              onTap: () {
                context.read<GetErasListCubit>().getErasList();
              },
            ),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: EraListview(eras: dummyEras()),
          );
        }
      },
    );
  }
}
