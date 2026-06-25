part of 'update_user_pass_cubit.dart';

sealed class UpdateUserPassState extends Equatable {
  const UpdateUserPassState();

  @override
  List<Object> get props => [];
}

final class UpdateUserPassInitial extends UpdateUserPassState {}

final class UpdateUserPassLoading extends UpdateUserPassState {}

final class UpdateUserPassSuccess extends UpdateUserPassState {}

final class UpdateUserPassFailure extends UpdateUserPassState {
  final String error;
  const UpdateUserPassFailure({required this.error});

  @override
  List<Object> get props => [error];
}
