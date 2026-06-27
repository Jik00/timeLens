import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/core/services/supabase_auth_service.dart';
import 'package:timelens/features/auth/data/models/user_model.dart';
import 'package:timelens/features/auth/domain/entities/user_entity.dart';
import 'package:timelens/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/services/get_it_service.dart';

class AuthRepoImpl extends AuthRepo {
  final SupabaseAuthService supabaseAuthService;

  AuthRepoImpl({required this.supabaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmail(
      String email, String password, String username) async {
    try {
      final user = await supabaseAuthService.signUpWithEmail(
          email: email, password: password, username: username);

      return Right(UserModel.fromSupabaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl.createUserWithEmail: $e');
      return Left(
        ServerFailure('just in case we added more logic in the future'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await supabaseAuthService.signInWithEmail(
          email: email, password: password);

      return Right(UserModel.fromSupabaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl.signInWithEmailAndPassword ${e.toString()}');
      return Left(
        ServerFailure('just in case we added more logic in the future'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      await supabaseAuthService.signInWithGoogle();

      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl.signInWithGoogle ${e.toString()}');
      return Left(
        ServerFailure('just in case we added more logic in the future'),
      );
    }
  }

  @override
  Stream<UserEntity?> authStateChanges() {
    return supabase.auth.onAuthStateChange.map((data) {
      final session = data.session;
      if (session == null) return null;

      return UserModel.fromSupabaseUser(session.user);
    });
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final session = supabase.auth.currentSession;
    if (session == null) return null;
    return UserModel.fromSupabaseUser(session.user);
  }

  @override
  Future<String?> getAccessToken() async {
    final session = supabase.auth.currentSession;
    if (session == null) return null;
    return session.accessToken;
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await supabaseAuthService.signOut();
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl.signOut ${e.toString()}');
      return Left(
        ServerFailure('just in case we added more logic in the future'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(String email) async {
    try {
      await supabaseAuthService.resetPassword(email);
      return right(unit);
    } on AuthException catch (e) {
      return left(ServerFailure(e.message));
    } on SocketException {
      return left(NetworkFailure('No internet connection.'));
    } catch (e) {
      return left(CustomException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePassword(String newPassword) async {
    try {
      await supabaseAuthService.updatePassword(newPassword);
      return right(unit);
    } on AuthException catch (e) {
      return left(ServerFailure(e.message));
    } on SocketException {
      return left(NetworkFailure('No internet connection.'));
    } catch (e) {
      return left(CustomException(e.toString()));
    }
  }


}
