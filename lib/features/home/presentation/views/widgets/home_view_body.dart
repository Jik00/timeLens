import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/home/presentation/cubit/cubit/get_eras_list_cubit.dart';
import 'package:timelens/features/home/presentation/views/widgets/eras_list_view_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<GetErasListCubit>().getErasList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  StrokeTextCizel(
                    title: context.loc.homeTitle,
                    colors: const [Colors.white, Colors.white],
                    titleSize: 18,
                    borderColor: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
            const ErasListViewBlocBuilder(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40.h,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
