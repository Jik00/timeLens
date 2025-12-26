import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/repos/era_repo/era_repo.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/widgets/build_app_bar.dart';
import 'package:timelens/core/widgets/timelens_title.dart';
import 'package:timelens/features/home/presentation/cubit/cubit/get_eras_list_cubit.dart';
import 'package:timelens/core/widgets/custom_button_navigation_bar.dart';
import 'package:timelens/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'homeViewId';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      appBar: buildAppBar(
        AppColors.blackBackground,
        const TimelensTitle(
          size: 18,
        ),
      ),
      bottomNavigationBar: const CustomButtonNavigationBar(),
      body: BlocProvider(
        create: (context) => GetErasListCubit(
          getIt.get<EraRepo>(),
        ),
        child: const HomeViewBody(),
      ),
    );
  }
}
