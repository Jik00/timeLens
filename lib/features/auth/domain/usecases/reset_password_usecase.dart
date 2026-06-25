import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/auth/domain/repos/auth_repo.dart';

class ResetPasswordUseCase {
  final AuthRepo _authRepo;

  ResetPasswordUseCase(this._authRepo);

  Future<Either<Failure, Unit>> call(String email) =>
      _authRepo.resetPassword(email);
}
