import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/eras/domain/entities/era_entity.dart';

abstract class EraRepo {
  Future<Either<Failure, List<EraEntity>>> getEras();
}
