part of 'get_figures_list_cubit.dart';

sealed class GetFiguresListState extends Equatable {
  const GetFiguresListState();

  @override
  List<Object> get props => [];
}

final class GetFiguresListInitial extends GetFiguresListState {}

final class GetFiguresListLoading extends GetFiguresListState {}

final class GetFiguresListSuccess extends GetFiguresListState {
  final List<FigureEntity> figures; 

  const GetFiguresListSuccess({required this.figures});

  @override
  List<Object> get props => [figures];
}

final class GetFiguresListFailure extends GetFiguresListState {
  final Failure failure;

  const GetFiguresListFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}