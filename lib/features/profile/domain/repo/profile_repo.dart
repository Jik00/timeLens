import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepo {
  /// Cache-first: returns cached if fresh, fetches otherwise.
  Future<Either<Failure, ProfileEntity>> getProfile(String userId);

  /// Called after user updates — writes directly to cache, no re-fetch.
  Future<Either<Failure, ProfileEntity>> updateProfile(ProfileEntity updated);

  Future<Either<Failure, ProfileEntity>> updateProfilePic(
      ProfileEntity updated, File imgFile);
}
