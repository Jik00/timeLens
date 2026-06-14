import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/features/auth/domain/repos/auth_repo.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit({ required this.authRepo}) : super(LogoutInitial());

  final AuthRepo authRepo;

  Future<void> logout() async {
    
    emit(LogoutLoading());

    final result = await authRepo.signOut();

    debugPrint('Logout result: $result');

    result.fold(
      (failure) => emit(LogoutFailure(failure.message)),
      (success) => emit(LogoutSuccess()),
    );

  }
}
