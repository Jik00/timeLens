import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/figures/domain/entities/figure_entity.dart';
import 'package:timelens/features/figures/domain/repos/figure_repo.dart';
import 'package:timelens/core/data_sources/supa_era_data_source.dart';

class FigureRepoImpl implements FigureRepo {
  final SupabaseDataSource dataSource;

  FigureRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<FigureEntity>>> getFigures( {required String eraCode}) async {
    try {
      final response = await dataSource.fetchDataBy(
          tableName: kSupaFiguresTable, query: kSupaBelongEra, value: eraCode);

      final figures = response.map((json) => FigureEntity.fromMap(json)).toList();

      debugPrint("Successfully fetched ${figures.length} figures");
      return Right(figures);
    } on PostgrestException catch (e) {
      debugPrint("Database error: ${e.message}");
      return Left(DatabaseFailure('Failed to fetch figures: ${e.message}'));
    } on SocketException catch (e) {
      debugPrint("Network error: $e");
      return Left(NetworkFailure('No internet connection'));
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return Left(ServerFailure('Failed to load figures: ${e.toString()}'));
    }
  }
}
