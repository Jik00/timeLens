part of 'get_eras_list_cubit.dart';

@immutable
sealed class GetErasListState {}

final class GetErasListInitial extends GetErasListState {}

final class GetErasListLoading extends GetErasListState {}

final class GetErasListSuccess extends GetErasListState {
  final List<EraEntity> eras;
  
  GetErasListSuccess({required this.eras});
}

final class GetErasListFailure extends GetErasListState {
  final String message;
  GetErasListFailure({required this.message});
}
