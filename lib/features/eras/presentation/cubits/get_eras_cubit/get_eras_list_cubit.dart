import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/features/eras/domain/repos/era_repo.dart';
import 'package:timelens/features/eras/domain/entities/era_entity.dart';

part 'get_eras_list_state.dart';

class GetErasListCubit extends Cubit<GetErasListState> {
  GetErasListCubit(this.eraRepo) : super(GetErasListInitial());

  final EraRepo eraRepo;

  Future<void> getErasList() async {
    emit(GetErasListLoading());

    final erasResult = await eraRepo.getEras();

    erasResult.fold(
      (failure) => emit(GetErasListFailure(message: failure.message)),
      (eras) => emit(
        GetErasListSuccess(eras: eras),
      ),
    );
  }
}
