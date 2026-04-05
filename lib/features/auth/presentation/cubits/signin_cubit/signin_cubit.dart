import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/features/auth/domain/entities/user_entity.dart';
import 'package:timelens/features/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial()) {

    // // Listen to auth state changes
    // authRepo.authStateChanges().listen((user) {
    //   if (user != null) {
    //     emit(SignInSuccess(user: user));
    //   } else {
    //     emit(SignInInitial());
    //   }
    // });
  }

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());

    final result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (userEntity) {
        emit(SignInSuccess(user: userEntity));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());

    final result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (_) {
        // Do nothing — user will be emitted via authStateChanges stream
      },
    );
  }
}
