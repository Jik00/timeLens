import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/core/repos/era_repo/era_repo.dart';
import 'package:timelens/features/home/data/data_sources/supa_era_data_source.dart';
import 'package:timelens/features/home/domain/entities/era_entity.dart';

class EraRepoImpl implements EraRepo {
  final SupabaseEraDataSource dataSource;

  EraRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<EraEntity>>> getEras() async {
    try {
      final response = await dataSource.fetchEras( tableName: kSupaErasTable);

      // Convert each map to EraEntity
      final eras = response.map((json) => EraEntity.fromMap(json)).toList();

      debugPrint("Successfully fetched ${eras.length} eras");
      return Right(eras);
      
    } on PostgrestException catch (e) {
      debugPrint("Database error: ${e.message}");
      return Left(DatabaseFailure('Failed to fetch eras: ${e.message}'));
    } on SocketException catch (e) {
      debugPrint("Network error: $e");
      return Left(NetworkFailure('No internet connection'));
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return Left(ServerFailure('Failed to load eras: ${e.toString()}'));
    }
  }
}