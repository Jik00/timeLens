import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/auth/domain/repos/auth_repo.dart';

class UpdatePasswordUseCase {
  final AuthRepo _authRepo;

  UpdatePasswordUseCase(this._authRepo);

  Future<Either<Failure, Unit>> call(String newPassword) =>
      _authRepo.updatePassword(newPassword);
}