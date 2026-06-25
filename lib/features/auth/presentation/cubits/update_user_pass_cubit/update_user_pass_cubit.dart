import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/features/auth/domain/usecases/update_password_usecase.dart';

part 'update_user_pass_state.dart';

class UpdateUserPassCubit extends Cubit<UpdateUserPassState> {
  UpdateUserPassCubit(this._updatePasswordUseCase) : super(UpdateUserPassInitial());

  final UpdatePasswordUseCase _updatePasswordUseCase;

  Future<void> updatePassword(String newPassword) async {
    emit(UpdateUserPassLoading());

    final result = await _updatePasswordUseCase(newPassword);

    result.fold(
      (failure) => emit(UpdateUserPassFailure(error: failure.message)),
      (_) => emit(UpdateUserPassSuccess()),
    );
  }
}