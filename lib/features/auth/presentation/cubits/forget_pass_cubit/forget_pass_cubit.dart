import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/auth/domain/usecases/reset_password_usecase.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ForgetPassCubit(this._resetPasswordUseCase) : super(ForgetPassInitial());

  Future<void> resetPassword(String email) async {
    emit(ForgetPassLoading());

    final Either<Failure, Unit> result = await _resetPasswordUseCase(email);

    result.fold(
      (failure) => emit(ForgetPassFailure(error : failure.message)),
      (_) => emit(ForgetPassSuccess()),
    );
  }
}


