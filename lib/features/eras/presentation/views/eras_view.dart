import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/widgets/custom_button_navigation_bar.dart';
import 'package:timelens/features/eras/domain/repos/era_repo.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/features/eras/presentation/cubits/get_eras_cubit/get_eras_list_cubit.dart';
import 'package:timelens/features/eras/presentation/views/widgets/eras_view_body.dart';

class ErasView extends StatelessWidget {
  const ErasView({super.key});

  static const routeName = 'homeViewId';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomButtonNavigationBar(),
      extendBody: true,
      body: BlocProvider(
        create: (context) => GetErasListCubit(
          getIt.get<EraRepo>(),
        )..getErasList(),
        child: const ErasViewBody(),
      ),
    );
  }
}
