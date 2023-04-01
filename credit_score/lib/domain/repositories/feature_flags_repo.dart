import 'package:credit_score/domain/entities/feature_flags_entity.dart';
import 'package:credit_score/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class FeatureFlagsRepo {
  Future<Either<Failure, FeatureFlagsEntity>> getFeatureFlagsFromDataSource();
}
