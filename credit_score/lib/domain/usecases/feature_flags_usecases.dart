import 'package:credit_score/domain/entities/feature_flags_entity.dart';
import 'package:credit_score/domain/failures/failures.dart';
import 'package:credit_score/domain/repositories/feature_flags_repo.dart';
import 'package:dartz/dartz.dart';

class FeatureFlagsUseCases {
  final FeatureFlagsRepo featureFlagsRepo;

  FeatureFlagsUseCases({required this.featureFlagsRepo});

  Future<Either<Failure, FeatureFlagsEntity>> getFeatureFlags() async {
    return featureFlagsRepo.getFeatureFlagsFromDataSource();
  }
}
