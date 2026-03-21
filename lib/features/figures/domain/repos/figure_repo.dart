import 'package:dartz/dartz.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/figures/domain/entities/figure_entity.dart';

abstract class FigureRepo {
  Future<Either<Failure, List<FigureEntity>>> getFigures(
      {required String eraCode});
}