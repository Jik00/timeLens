part of 'get_mssgs_cubit.dart';

sealed class GetMssgsState extends Equatable {
  const GetMssgsState();

  @override
  List<Object> get props => [];
}

final class GetMssgsInitial extends GetMssgsState {}

final class GetMssgsLoading extends GetMssgsState {}

final class GetMssgsSuccess extends GetMssgsState {
  final List<MssgEntity> mssgs;
  const GetMssgsSuccess({required this.mssgs});

  @override
  List<Object> get props => [mssgs];
}

final class GetMssgsFailure extends GetMssgsState {
  final String message;
  const GetMssgsFailure({required this.message});

  @override
  List<Object> get props => [message];
}
