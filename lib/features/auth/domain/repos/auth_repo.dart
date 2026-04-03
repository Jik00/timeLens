import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmail(
      String email, String password, String username);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, void>> signInWithGoogle();

  Stream<UserEntity?> authStateChanges();

}
