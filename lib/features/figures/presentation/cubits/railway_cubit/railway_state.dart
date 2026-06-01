part of 'railway_cubit.dart';

sealed class RailwayState extends Equatable {
  const RailwayState();

  @override
  List<Object> get props => [];
}

final class RailwayInitial extends RailwayState {}

final class RailwayLoading extends RailwayState {}

final class RailwaySuccess extends RailwayState {
  final bool success;

  const RailwaySuccess(this.success);

  @override
  List<Object> get props => [success];
}

final class RailwayFailure extends RailwayState {
  final String error;

  const RailwayFailure(this.error);

  @override
  List<Object> get props => [error];
}
