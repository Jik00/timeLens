import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/core/widgets/stroke_text_cinzel.dart';
import 'package:timelens/features/home/presentation/cubits/get_eras_cubit/get_eras_list_cubit.dart';
import 'package:timelens/features/home/presentation/views/widgets/eras_list_view_bloc_builder.dart';

import '../../../../../core/utils/app_images.dart';

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
        Positioned.fill(
          child: Image.asset(
            Assets.assetsImagesBackground,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 62),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 62.h,
                    ),
                    StrokeTextCizel(
                      title: context.loc.homeTitle,
                      colors: const [Colors.white, Colors.white],
                      // colors: const [
                      //   AppColors.brownWriting,
                      //   AppColors.brownWriting
                      // ],
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
        ),
        // const Align(
        //   alignment: Alignment.bottomCenter,
        //   child: CustomButtonNavigationBar(),
        // ),
      ],
    );
  }
}
