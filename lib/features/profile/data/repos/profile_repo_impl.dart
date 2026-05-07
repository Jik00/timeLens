import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/data_sources/supa_data_source.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/profile/domain/entities/profile_entity.dart';
import 'package:timelens/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final SupabaseDataSource dataSource;

  ProfileRepoImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, ProfileEntity>> getProfile(String userId) async {
    try {
      log("Fetching profile for userId: $userId");

      final data = await dataSource.fetchSingleById(
          tableName: kSupaProfilesTable, id: userId);

      return Right( ProfileEntity.fromMap(data));
    } catch (e) {
      log("Error fetching profile: $e");
      return Left(CustomException("Failed to fetch profile"));
    }
  }
}
