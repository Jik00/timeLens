import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:timelens/core/data_sources/supa_data_source.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/features/profile/data/datasource/hive_profile_datasource.dart';
import 'package:timelens/features/profile/domain/entities/profile_entity.dart';
import 'package:timelens/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final SupabaseDataSource _supabaseDataSource;
  final HiveProfileDataSource _localDataSource;

  ProfileRepoImpl({
    required SupabaseDataSource supabaseDataSource,
    required HiveProfileDataSource localDataSource,
  })  : _supabaseDataSource = supabaseDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Either<Failure, ProfileEntity>> getProfile(String userId) async {
    try {
      final cached = await _localDataSource.getCachedProfile(userId);
      final stale = await _localDataSource.isCacheStale(userId);

      // ✅ Cache hit & fresh — return immediately
      if (cached != null && !stale) {
        log('ProfileRepo: returning fresh cached profile');
        return Right(cached);
      }

      // 🌐 Cache miss or stale — fetch from network
      log('ProfileRepo: fetching from Supabase');
      final data = await _supabaseDataSource.fetchSingleById(
        tableName: kSupaProfilesTable,
        id: userId,
      );

      final profile = ProfileEntity.fromMap(data);
      await _localDataSource.cacheProfile(profile); // updates timestamp too
      return Right(profile);

    } catch (e) {
      log('ProfileRepo: fetch failed — $e');

      // 🛟 Network failed but we have stale cache? return it as fallback
      final cached = await _localDataSource.getCachedProfile(userId);
      if (cached != null) {
        log('ProfileRepo: returning stale cache as fallback');
        return Right(cached);
      }

      return Left(CustomException('Failed to load profile'));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(ProfileEntity updated) async {
    try {
      await _supabaseDataSource.updateData(
        tableName: kSupaProfilesTable,
        query: kUserIdQuery,
        value: updated.id,
        newData: updated.toMap(),
      );

      // ✅ Write directly to cache — no re-fetch needed
      await _localDataSource.cacheProfile(updated);
      return Right(updated);
    } catch (e) {
      log('ProfileRepo: update failed — $e');
      return Left(CustomException('Failed to update profile'));
    }
  }
}