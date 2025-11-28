import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:timelens/core/helper_functions/get_dummy_era_item.dart';
import 'package:timelens/core/widgets/custom_error_widget.dart';
import 'package:timelens/features/home/presentation/cubit/cubit/get_eras_list_cubit.dart';
import 'package:timelens/features/home/presentation/views/widgets/era_listview.dart';

class ErasListViewBlocBuilder extends StatelessWidget {
  const ErasListViewBlocBuilder({super.key});

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
            ),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: EraListview(eras: getDummyEras()),
          );
        }
      },
    );
  }
}
