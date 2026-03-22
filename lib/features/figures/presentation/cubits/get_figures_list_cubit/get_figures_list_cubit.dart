import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/figures/domain/entities/figure_entity.dart';
import 'package:timelens/features/figures/domain/repos/figure_repo.dart';

part 'get_figures_list_state.dart';

class GetFiguresListCubit extends Cubit<GetFiguresListState> {
  GetFiguresListCubit({required this.figureRepo})
      : super(GetFiguresListInitial());

  final FigureRepo figureRepo;

  Future<void> getFiguresList({required String eraName}) async {
    emit(GetFiguresListLoading());

    final response = await figureRepo.getFigures(eraName: eraName);

    response.fold(
      (failure) => emit(GetFiguresListFailure(failure: failure)),
      (figures) => emit(GetFiguresListSuccess(figures: figures)),
    );
  }
}
