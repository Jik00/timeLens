part of 'forget_pass_cubit.dart';

sealed class ForgetPassState extends Equatable {
  const ForgetPassState();

  @override
  List<Object> get props => [];
}

final class ForgetPassInitial extends ForgetPassState {}

final class ForgetPassLoading extends ForgetPassState {}

final class ForgetPassSuccess extends ForgetPassState {}

final class ForgetPassFailure extends ForgetPassState {
  final String error;
  const ForgetPassFailure({required this.error});

  @override
  List<Object> get props => [error];
}
