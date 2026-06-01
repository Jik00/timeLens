import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/enums/railway_mssg.dart';
import 'package:timelens/features/figures/domain/repos/figure_repo.dart';

part 'railway_state.dart';

class RailwayCubit extends Cubit<RailwayState> {
  RailwayCubit({required this.figureRepo}) : super(RailwayInitial());

  final FigureRepo figureRepo;

  Future<void> setMessage(RailwayMessage message) async {
    emit(RailwayLoading());
    try {
      final success = await figureRepo.setMessage(message);
      emit(RailwaySuccess(success));
    } catch (e) {
      emit(RailwayFailure(e.toString()));
    }
  }
}
