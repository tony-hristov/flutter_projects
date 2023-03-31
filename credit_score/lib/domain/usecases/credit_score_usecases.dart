import 'package:credit_score/domain/entities/credit_score_entity.dart';
import 'package:credit_score/domain/failures/failures.dart';
import 'package:credit_score/domain/repositories/credit_score_repo.dart';
import 'package:dartz/dartz.dart';

class CreditScoreUseCases {
  final CreditScoreRepo creditScoreRepo;

  CreditScoreUseCases({required this.creditScoreRepo});

  Future<Either<Failure, CreditScoreEntity>> getCreditScore() {
    return creditScoreRepo.getCreditScoreFromDataSource();
  }
}
