import 'package:credit_score/domain/entities/credit_score_entity.dart';
import 'package:credit_score/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CreditScoreRepo {
  Future<Either<Failure, CreditScoreEntity>> getCreditScoreFromDataSource();
}
